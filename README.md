<!-- Improved compatibility of back to top link -->

<a id="readme-top"></a>

<!-- PROJECT LOGO -->

<br />
<div align="center">
  <a href="https://github.com/croc001/Point_and_click.git">
  </a>

  <h3 align="center">Point-And-Click Mystery Game – Installation Guide</h3>

  <p align="center">
    A short guide to install, build, and experience our mysterious point-and-click game.
    <br />
    <a href="https://github.com/croc001/Point_and_click.git"><strong>Explore the docs »</strong></a>
  </p>
</div>

<!-- TABLE OF CONTENTS -->

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation-build-yourself">Installation (Build Yourself)</a></li>
        <li><a href="#installation-executable">Installation (Executable)</a></li>
        <li><a href="#installing-the-ai">Installing the AI</a></li>
      </ul>
    </li>
    <li><a href="#how-to-play">How to Play</a></li>
    <li><a href="#creators">Creators</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

## About the Project

This is a short guide to help you get through the installation process of our point-and-click mystery game demo – and uncover its secrets with the help of artificial intelligence.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Getting Started

### Prerequisites

To build the game yourself, you’ll need to install **Godot**:

* [Download for Windows](https://godotengine.org/download/windows/)
* [Download for macOS](https://godotengine.org/download/macos/)

Additionally, AI support requires installing **Ollama** and a compatible language model – more on that below.

## Installation (Build Yourself)

*If you’d like to build the game from source, follow these steps like a true adventurer:*

1. Clone the repository:

   ```sh
   git clone https://github.com/croc001/Point_and_click.git
   ```

2. Open the game project in Godot.

3. In Godot, go to:
   `Editor -> Manage Export Templates -> Download from Official GitHub Releases mirror`
   Click **Download and Install**, then click **Close** once it’s done.

4. Navigate to:
   `Project -> Export -> Add -> Windows (Desktop)`
   Choose a save location and click **Export Project**.

5. Click **OK** to confirm.
   You can ignore any warning messages.

6. Locate the exported `.exe` file – double-click to launch the game.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Installation (Executable)

*If building isn’t your thing, just download and play:*

1. Download the game:
   [Download from Mediafire](https://www.mediafire.com/file/m9vkdg7947uzuda/goofy-ahh-game.zip/file)

2. Unzip the folder.

3. Double-click the `game` file inside the folder to launch it.

4. If your PC warns you, click “Trust this source” or “Run anyway”.

Have fun!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Installing the AI

To use the **AI dialogue system**, follow these steps.</br>
⚠️ The game **will not work** without the AI running.

### Requirements

* Operating System: Windows, macOS, or Linux
* At least **8 GB of RAM** recommended

### Step 1: Install Ollama

Install Ollama using this terminal command:

```sh
curl -fsSL https://ollama.com/install.sh | sh
```

Alternatively, download it here: [https://ollama.com](https://ollama.com)

### Step 2: Download the LLaMA 2 Model

Pull the required 7B model:

```sh
ollama pull llama2:7b
```

This will download \~3–4 GB and store the model locally.

### Step 3: Run the Model

Start the model with:

```sh
ollama run llama2:7b
```

Expected output:

```
Starting llama2:7b...
Listening on http://localhost:11434
```

### Step 4: Connect to the Game (in Godot)

1. Open the file `interrogation_ai.gd`.

2. Find this line:

```gdscript
"model": "llama2:7b"
```

3. To use another model (e.g. `mistral`, `llama3`), change the value:

```gdscript
"model": "mistral"
```

Make sure to pull the model first:

```sh
ollama pull mistral
```

> ⚠️ The game is currently configured to run with `"llama2:7b"`. Other models may require adjustments.

### ✅ Quick Command Overview

| Purpose               | Command                                                                     |      |
| --------------------- | --------------------------------------------------------------------------- | ---- |
| Install Ollama        | \`curl -fsSL [https://ollama.com/install.sh](https://ollama.com/install.sh) | sh\` |
| Download model        | `ollama pull llama2:7b`                                                     |      |
| Run the model         | `ollama run llama2:7b`                                                      |      |
| Check connection      | `curl http://localhost:11434`                                               |      |
| List installed models | `ollama list`                                                               |      |

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## How to Play

Welcome, detective. Here’s how you navigate the shadows:

### 🧩 Lockpick Minigame

* Move lockpick: **Arrow keys (← / →)**
* Turn the lock: **ENTER**

### 🧠 Evidenceboard Minigame

* Select words: **Left-click** on words to fill blanks
* Check answers: **Click** the check button
* Remove answers: **Click** the word in the text, press **Backspace**
* Words fill the **next available blank**

### 🕵️ General Controls

* Interact with objects/people: **Left-click**
* Advance dialogues: **Left-click**

### 📱 UI Controls

* Open/close the phone: **Mouse wheel**
* Select apps: **Left-click**

### 🗺️ Map Navigation

* Travel to locations: **Left-click** on **grey-grounded** buildings

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Creators

<div style="display: flex; justify-content: space-evenly; flex-wrap: nowrap; gap: 20px;">
  <div style="text-align: center; flex: 1;">
    <h4><a href="https://github.com/croc001">croc001</a></h4>
  </div>
  <div style="text-align: center; flex: 1;">
    <h4><a href="https://github.com/Thewischmoop">Thewischmoop</a></h4>
  </div>
  <div style="text-align: center; flex: 1;">
    <h4><a href="https://github.com/uhahne">uhahne</a></h4>
  </div>
  <div style="text-align: center; flex: 1;">
    <h4><a href="https://github.com/Agon69">Agon69</a></h4>
  </div>
  <div style="text-align: center; flex: 1;">
    <h4><a href="https://github.com/MareikeMKB">MareikeMKB</a></h4>
  </div>
  <div style="text-align: center; flex: 1;">
    <h4><a href="https://github.com/420Pierre">420Pierre</a></h4>
  </div>
</div>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Acknowledgments

Tools and inspirations we used:

* [Best-README-Template](https://github.com/othneildrew/Best-README-Template)
* [Godot](https://godotengine.org/)
* [GitHub](https://github.com/)
* [Obsidian](https://obsidian.md/)
* [Aseprite](https://www.aseprite.org/)
* [Ollama](https://ollama.com/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>
