# Home Assistant Add-on: Namer

[![Release][release-shield]][release] ![Project Stage][project-stage-shield] ![Project Maintenance][maintenance-shield]

Namer Add-on for Home Assistant - Tool for renaming and tagging adult video files with metadata from ThePornDB.

## About

Namer is a powerful web app, folder watchdog and command line tool for renaming adult video files and tagging mp4 video files in a way that helps plex/jellyfin/emby and related plugins extract that data or lookup data with ThePornDB's plugins.

This add-on packages Namer for easy installation and configuration within Home Assistant.

Features of Namer:
- Supports perceptual hashes to identify video files without parsable names
- Can watch directories for new files to name, tag, and move
- Provides a web UI for manual matching of files
- Can write .nfo files with metadata and download images and trailers
- Retries failed files on a configurable schedule

![Namer Logo](https://raw.githubusercontent.com/ThePornDatabase/namer/main/logo/namer.png)

[release-shield]: https://img.shields.io/badge/version-v1.0.0-blue.svg
[release]: https://github.com/brunzbrunz/namer-addon
[project-stage-shield]: https://img.shields.io/badge/project%20stage-experimental-yellow.svg
[maintenance-shield]: https://img.shields.io/maintenance/yes/2025.svg
