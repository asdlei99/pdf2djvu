# encoding=UTF-8

# Copyright © 2009, 2012 Jakub Wilk
#
# This package is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 2 dated June, 1991.

from common import (
    case,
)

class test(case):
    '''
    http://code.google.com/p/pdf2djvu/issues/detail?id=4
    fixed in [b58852fbb5ec]
    '''
    def test(self):
        self.pdf2djvu().assert_()

# vim:ts=4 sw=4 et
