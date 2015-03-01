# encoding=UTF-8

# Copyright © 2014-2015 Jakub Wilk
#
# This package is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 2 dated June, 1991.

from common import (
    SkipTest,
    case,
    re,
)

class test(case):
    def test(self):
        self.pdf2djvu().assert_()
        r = self.djvudump()
        r.assert_(stdout=re(r'\A(\s+(?!BG)\S+.*\n)+\Z'))

# vim:ts=4 sts=4 sw=4 et
