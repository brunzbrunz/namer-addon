# Home Assistant Add-on: Namer

## Installation

Follow these steps to get the add-on installed on your system:

1. Navigate in your Home Assistant frontend to **Supervisor** -> **Add-on Store**.
2. Add this repository URL: `https://github.com/brunzbrunz/namer-addon`
3. Find the "Namer" add-on and click it.
4. Click on the "INSTALL" button.

## Configuration

### Add-on Configuration

```yaml
porndb_token: "your_porndb_api_token"
watch_dir: "/media/watch"
work_dir: "/media/work"
failed_dir: "/media/failed"
dest_dir: "/media/dest"
web: true
web_port: 6980
```

#### Option: `porndb_token` (required)

This is your API token from ThePornDB. You need to create an account at [ThePornDB](https://theporndb.net) and generate an API token in your profile.

#### Option: `watch_dir` (required)

The directory where Namer will watch for new files. When new files are added to this directory, Namer will process them.

#### Option: `work_dir` (required)

The directory where Namer moves files during processing.

#### Option: `failed_dir` (required)

The directory where Namer moves files that couldn't be matched. These will be retried according to the retry schedule.

#### Option: `dest_dir` (required)

The directory where Namer will place successfully processed files.

#### Option: `web` (optional)

Enable or disable the web interface. Default is `true`.

#### Option: `web_port` (optional)

Port for the web interface. Default is `6980`.

### Directory Structure Setup

Before starting Namer, ensure you have created the following directories on your Home Assistant device:

1. **watch_dir**: Create this folder where you'll place new files for Namer to process
2. **work_dir**: Temporary work directory 
3. **failed_dir**: Where unmatched files will be placed
4. **dest_dir**: Final destination for successfully processed files

**IMPORTANT**: These directories should NOT be nested within each other to avoid processing issues.

## How to use

1. Configure the add-on with your ThePornDB API token and directory paths
2. Start the add-on
3. Place files in your configured watch directory
4. Namer will automatically process files and move them to the destination directory
5. For files that cannot be automatically matched, access the web UI at `http://your-home-assistant:6980/` to manually match them

## File Naming Format

Namer expects files to be in a format like:
```
sitename-[YY]YY-MM-DD-Scene.and.or.performer.name.mp4
```

The separating characters (dashes, dots, or spaces) are interchangeable. Having a proper site name, date, and scene or performer information greatly improves matching accuracy.

## Support

Got issues or questions? Please report them in the issue tracker on GitHub:
https://github.com/brunzbrunz/namer-addon/issues
