# Password Tool

A simple CLI-based Ruby tool that generates secure passwords and evaluates their strength based on entropy.

![Password Tool Demo](https://i.imgur.com/placeholder-image.png)

## 📋 Features

- **Password Generation**: Generate random secure passwords with customizable length and character sets
- **Strength Evaluation**: Evaluate password strength using entropy-based calculations
- **CLI Interface**: Simple command-line interface with intuitive options

## 🔧 Installation

### Prerequisites

- Ruby (version 2.0 or higher)

### Setup

```bash
# Clone this repository
git clone https://github.com/username/passwordgen-tool.git

# Change into the project directory
cd passwordgen-tool

# Make the script executable
chmod +x passwordgen.rb
```

### Global Installation (Optional)

To use the tool from anywhere on your system:

```bash
sudo cp password_tool.rb /usr/local/bin/passwordgen
sudo chmod +x /usr/local/bin/passwordgen
```

## 🚀 Usage

### Basic Usage

Run the script with default settings:

```bash
./passwordgen.rb
```

### Command-line Options

| Option | Description |
|--------|-------------|
| `--length=LENGTH` | Specify password length (default: 12) |
| `--no-uppercase` | Exclude uppercase letters |
| `--no-numbers` | Exclude numbers |
| `--no-symbols` | Exclude symbols |

### Examples

**Generate a default password** (12 characters with all character types):
```bash
./passwordgen.rb
```
```
Generated Password: aB4#vTp9$kR2
Entropy: 128.9 bits
Strength: Strong 🟢
```

**Generate a longer password without symbols**:
```bash
./passwordgen.rb --length=16 --no-symbols
```
```
Generated Password: xjU3b7dL9fQk2WzX
Entropy: 125.6 bits
Strength: Strong 🟢
```

**Generate a password without uppercase letters and numbers**:
```bash
./passwordgen.rb --length=20 --no-uppercase --no-numbers
```
```
Generated Password: jxkz@!!fbrmqtcjwzyv
Entropy: 92.1 bits
Strength: Moderate 🟡
```

## 📊 Password Strength Criteria

The strength of passwords is evaluated using entropy-based calculations:

| Strength | Entropy | Indicator |
|----------|---------|-----------|
| Weak | < 50 bits | 🔴 |
| Moderate | 50-100 bits | 🟡 |
| Strong | > 100 bits | 🟢 |

