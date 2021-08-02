#!/usr/bin/env python3

import re


async def generate(hub, **pkginfo):

	html = await hub.pkgtools.fetch.get_page("https://www.clamav.net/downloads")
	version = (re.search(f"clamav-([0-9.]*).tar.gz", html)).group(1)
	url = f"https://www.clamav.net/downloads/production/clamav-{version}.tar.gz"
	artifacts = [hub.pkgtools.ebuild.Artifact(url=url)]

	ebuild = hub.pkgtools.ebuild.BreezyBuild(**pkginfo, version=version, artifacts=artifacts)
	ebuild.push()


# vim: ts=4 sw=4 noet
