#!/usr/bin/env python3

import sys
import logging
import typing as T
from pathlib import Path
from PIL import Image


logging.basicConfig()
log = logging.getLogger('check_png_format')


class AlphaChannelError(Exception):
    """Alert when one of the scanned images contains an alpha channel."""
    def __init__(self, msg: str = "", **kwargs) -> None:
        self.image_format: str = kwargs.get('format', "unknown alpha-channel")
        self.image_path: Path | None = kwargs.get('path')
        if not msg:
            msg = " ".join([
                f"Found {self.image_format} format image",
                f"at {self.image_path}",
            ])
        super().__init__(msg)

    def github_actions_error(self):
        file = self.image_path.resolve()
        title= "Invalid PNG format detected!"
        message= (
            f"`{self.image_path}` is in {self.image_format} format, "
            + "which contains an alpha channel. Convert it to a "
            "non-transparent format."
        )
        return f"::error file={file},title={title}::{message}"


def check_image_format(path: Path) -> bool:
    """Determine whether an image file has an alpha channel."""
    log.debug("Checking file: %s", path)
    image = Image.open(path.resolve())
    image_format = image.mode
    bands = image.getbands()
    log.debug("Found %s format image with bands: %s", image_format, bands)
    if bands[-1] in ('a', 'A'):
        raise AlphaChannelError(path=path, format=image_format)
    return True


def scan_directory(img_dir: Path) -> int:
    """Call check_image_format on all PNG files in a directory tree."""
    log.debug("Recursively scanning directory: %s", img_dir)
    error_count = 0
    for png in img_dir.rglob('*.png', case_sensitive=False):
        try:
            check_image_format(png)
        except AlphaChannelError as ex:
            print(ex.github_actions_error())
            error_count += 1
    return error_count


if __name__ == "__main__":
    args = set(sys.argv[1:])
    if '--debug' in args:
        log.setLevel(logging.DEBUG)
        args = args - set(['--debug'])
    target_dirs = list(args) or ['.']
    log.debug("Beginning scan of %d paths", len(target_dirs))
    errors = sum(
        scan_directory(Path(target_dir))
        for target_dir in target_dirs)
    sys.exit(errors)
