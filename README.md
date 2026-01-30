# No More Standups

Automate your standups and save time for meaningful work.

## Overview

No More Standups is a tool that helps you automate the creation and management of standup updates. It uses AI to generate meaningful, context-aware status updates by analyzing your git commits, JIRA/GitHub issues, and other work artifacts.

## Prerequisites

- **Git** - For version control and cloning the repository
  - Install on macOS: `brew install git`
  - Install on Linux: `sudo apt install git` or equivalent for your distro
  - Install on Windows: Download from [git-scm.com](https://git-scm.com/downloads)

- **Node.js 18+** - JavaScript runtime 
  - Install on macOS: `brew install node@18`
  - Install on Linux: Use [nvm](https://github.com/nvm-sh/nvm) or package manager
  - Install on Windows: Download from [nodejs.org](https://nodejs.org/)

- **pnpm 10+** - Fast, disk space efficient package manager
  - Install on macOS/Linux: `npm install -g pnpm`
  - Install on Windows: `npm install -g pnpm`
  - Or via Homebrew: `brew install pnpm`

## Installation

### Setup pnpm Global Environment (Important)

Before using pnpm's global features, you need to set up its environment:

```bash
# Set up pnpm global bin directory
pnpm setup

# Reload your shell configuration
source ~/.bashrc  # For bash
# OR 
source ~/.zshrc   # For zsh
```

This is required to use global pnpm features like `pnpm link --global`.

### Project Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/no-more-standups.git
   cd no-more-standups
   ```

2. Install dependencies:
   ```bash
   pnpm install
   ```

3. Build the packages:
   ```bash
   pnpm build
   ```

### Global Installation (for development)

To use the CLI globally during development:

```bash
cd packages/cli
pnpm link --global
```

If you get an error about "Unable to find the global bin directory", you need to run the pnpm setup instructions from the Prerequisites section.

## Usage

### Running the CLI

After building the packages, you can run the CLI directly:

```bash
node packages/cli/dist/index.js
```

Note: You need to create a configuration file first (see Configuration section below) or you'll get a "Config file not found" error.

### Development Commands

For development, use these commands from the project root:

```bash
# From the root directory
pnpm build     # Build all packages
pnpm test      # Run tests
pnpm lint      # Run linting
pnpm format    # Format code
pnpm cli:dev   # Run the CLI in dev mode (recommended)
```

Alternatively, you can run the dev command directly from the CLI package:

```bash
# From the CLI package directory
cd packages/cli
pnpm dev
```

## Configuration

Before running the CLI, create a configuration file at `~/.nms/config.json` with the following structure:

```json
{
  "llmProvider": {
    "apiKey": "your-api-key",
    "model": "gpt-4",
    "provider": "openai"
  },
  "user": {
    "name": "Your Name",
    "email": "your-email@example.com"
  }
}
```

You can create this file with:

```bash
mkdir -p ~/.nms
```

Then create the file `~/.nms/config.json` with your editor, or use:

```bash
cat > ~/.nms/config.json << EOF
{
  "llmProvider": {
    "apiKey": "your-api-key",
    "model": "gpt-4",
    "provider": "openai"
  },
  "user": {
    "name": "Your Name",
    "email": "your-email@example.com"
  }
}
EOF
```

Supported providers:
- `openai`
- `gemini`
- `claude`

## Development

### Project Structure

```
no-more-standups/
├─ packages/
│  ├─ cli/        # Command-line interface
│  │  ├─ src/
│  │  └─ ...
│  └─ core/       # Core functionality
│     ├─ src/
│     └─ ...
└─ ...
```

### Available Scripts

- Build all packages:
  ```bash
  pnpm build
  ```

- Run tests:
  ```bash
  pnpm test
  ```

- Lint code:
  ```bash
  pnpm lint
  ```

- Format code:
  ```bash
  pnpm format
  ```

### Local Development

1. Make changes to source code
2. Build the packages:
   ```bash
   pnpm build
   ```
3. Test your changes:
   ```bash
   pnpm test
   ```

## Testing

Run the test suite with:

```bash
pnpm test
```

## Adding Dependencies

- Add a dependency to a specific package:
  ```bash
  pnpm --filter @no-more-standups/core add <package-name>
  ```

- Add a development dependency to the root:
  ```bash
  pnpm add -D <package-name>
  ```

## Troubleshooting

### PNPM Global Bin Directory Error

If you see this error:
```
ERR_PNPM_NO_GLOBAL_BIN_DIR  Unable to find the global bin directory
```

Fix it with:
```bash
pnpm setup
source ~/.bashrc  # or ~/.zshrc for zsh users
```

### TypeScript File Extension Errors

If you get errors about unknown file extensions with .ts files, use:

```bash
# From the root directory
pnpm cli:dev
```

This command will properly execute the CLI in development mode.

### Missing Configuration

If you get a "Config file not found" error, make sure you've created the configuration file at `~/.nms/config.json`.

## License

This project is licensed under the ISC License. # homebrew-tap
