# ⚡ Kint-V1.0 — Stealth Screen AI (Fullstack Developer Edition)

**Kint-V1.0** is an invisible, high-performance Fullstack Developer interview & coding assistant that reads questions, live coding prompts, and technical architecture tasks directly from your screen (React, Next.js, Node.js, TypeScript/JavaScript) and delivers optimal, production-grade solutions in real time.

Built with **Windows Display Affinity (`WDA_EXCLUDEFROMCAPTURE`)**, making it **100% invisible** to screen-sharing tools including **Microsoft Teams, Google Meet, Zoom, OBS, and browser capture**.

---

## 🚀 Key Features

- **🛡️ 100% Background Stealth & Screen Share Invisibility**: Runs silently in the background and is completely invisible to recording/screen-sharing tools (**Teams, Zoom, Meet, OBS, Discord**) via `WDA_EXCLUDEFROMCAPTURE`.
- **⚡ Floating Teleprompter Code Card**: Immediately pops up with the clean solution code upon solving. Features syntax highlighting (Catppuccin theme), line numbers, time & space complexity, font resizing (`A-`/`A+`), and opacity control (`95%` → `30%`), 100% hidden from screen share!
- **⚡ Instant F9 Scan & Auto-Clipboard**: Press **`F9`** anywhere on your screen. Kint-V1.0 captures the question, solves it, and **automatically copies the clean solution directly into your clipboard** ready to paste (`Ctrl+V`).
- **🔔 Discreet Notification Alert (OSD Pill)**: Displays a sleek, discreet floating capsule notification confirming the solution is ready and copied, along with the solver latency (e.g. `✓ Solution Ready (Groq • 0.8s)`).
- **🔒 Click-Through Ghost Mode**: Toggle click-through mode (`🔓 Focus` / `🔒 Thru`) so mouse clicks pass straight through the teleprompter directly into your browser or code editor!
- **⚡ Multi-AI Provider Auto-Failover**:
  - **Groq LPU** (`openai/gpt-oss-120b`): Ultra-fast solver (< 0.8s) with a massive **14,400 free requests/day** limit.
  - **Gemini Multimodal Vision** (`gemini-3.6-flash`): Reads diagrams, constraints, code editor, and input/output samples from screenshots.
  - **5-Second Auto-Switching**: If any provider encounters a rate limit or timeout, Kint-V1.0 seamlessly switches to backup models.
- **📜 Auto-Scroll Capture & Stitching**:
  - Automatically scrolls the problem description pane top-to-bottom.
  - Captures 3 sequential viewpoints and stitches them into a single high-resolution image.
  - Smoothly restores your original scroll position and cursor location.
- **🔍 Native Windows 10/11 OCR (`winocr`)**:
  - Automatically extracts screen text using Windows' built-in OCR engine without requiring external Tesseract installations.
- **🖥️ Dedicated Boss Hotkeys (`F10` / `F8` / `Esc`)**:
  - Press **`F10`** or **`F8`** anywhere to instantly toggle the Floating Teleprompter Card on/off screen.
  - Press **`Esc`** when focused to immediately hide it.
  - Press **`Ctrl + Shift + H`** to open the full diagnostic HUD and settings.

---

## 📦 Quick Installation

### 1. Clone Repository & Install Dependencies
Open PowerShell or CMD in the project folder:
```powershell
pip install -r requirements.txt
```

*(Note: `winocr` provides instant native Windows OCR. External Tesseract installation is completely optional!)*

### 2. Configure API Keys
You can set your keys in the `.env` file:
```env
GEMINI_API_KEY=your_gemini_api_key_here
GROQ_API_KEY=your_groq_api_key_here
```
Or press **`Ctrl + 1`** to open the Key Manager to paste, test, and save your keys.

- **Get Free Groq Key**: [console.groq.com](https://console.groq.com) (14,400 req/day — blazing fast)
- **Get Free Gemini Key**: [aistudio.google.com](https://aistudio.google.com) (1,500 req/day)

---

## 🎯 How to Run

### Direct Launch (Recommended)
Right-click **`run.bat`** and select **Run as administrator**  
*OR* in an Administrator PowerShell window:
```powershell
python main.py
```

> **Why Administrator?** Windows requires administrative privileges to register the global background hotkey (**F9**) across all active third-party windows (Chrome, Edge, HackerRank).

---

## 🎮 Controls & Shortcuts

| Action | Control | Description |
|---|---|---|
| **Scan, Solve & Display** | **F9** | Scans question, solves optimal code, displays Floating Teleprompter, copies to clipboard (`Ctrl+V`). |
| **Toggle Teleprompter Card** | **F10** or **F8** | Instantly shows or hides the floating semi-transparent teleprompter code card on screen. |
| **Panic / Boss Hide** | **Esc** | Instantly dismisses and hides the teleprompter card. |
| **API Key Manager** | **Ctrl + 1** | Instantly opens the stealth Multi-AI key manager to change or test Gemini/Groq keys. |
| **Settings / Diagnostic HUD** | **Ctrl + Shift + H** | Shows / hides the full diagnostic HUD overlay (for reading full logs or adjusting options). |
| **Emergency Shutdown** | **Ctrl + Shift + Q** | Completely kills and terminates the background application. |
| **Cycle Card Opacity** | **[👁 85%]** or **Ctrl + [** | Cycles opacity: 95% → 85% → 70% → 50% → 30%. |
| **Code Zoom In / Out** | **A+ / A-** (or **Ctrl + = / -**) | Dynamically scales the code font size (8pt to 20pt). |
| **Click-Through Mode** | **[🔓 Focus]** | Allows mouse clicks to pass through the card directly into the editor below. |
| **Toggle Approach View** | **[Approach]** | Toggles between clean code and Time/Space complexity analysis. |
| **Fold / Minimize** | **▲ / ▼** (or double-click header) | Collapses teleprompter card into an ultra-slim status pill. |
| **Move Window** | **Drag Header** | Drag header to position the teleprompter anywhere on any monitor. |
| **Resize Card** | **Drag ◢ Corner** | Drag bottom-right corner grip to resize card width/height. |

---

## 🏗️ Build Standalone EXE

To compile a single executable file:
1. Double-click **`build.bat`**  
   *OR* run:
   ```powershell
   pyinstaller --onefile --noconsole --name Kint-V1.0 main.py
   ```
2. The compiled binary will be located at `dist\Kint-V1.0.exe`.
3. Right-click `dist\Kint-V1.0.exe` → **Run as administrator**.

---

## ⚙️ Configuration Reference

All settings can be customized at the top of [main.py](main.py):

```python
GEMINI_API_KEY = "YOUR_API_KEY_HERE"
GROQ_API_KEY = "YOUR_GROQ_KEY_HERE"
HOTKEY = "f9"
DEFAULT_MODEL = "gemini-3.6-flash"
FALLBACK_MODELS = ["gemini-flash-latest", "gemini-3.8-flash"]
GROQ_MODEL = "openai/gpt-oss-120b"
GROQ_FALLBACK_MODEL = "groq/compound-mini"
OVERLAY_WIDTH = 540
OVERLAY_HEIGHT = 680
OPACITY = 0.95
```

---

## 🔧 Troubleshooting

| Problem | Cause & Fix |
|---|---|
| **Hotkey F9 not responding** | Ensure you launched via `run.bat` or PowerShell **as Administrator**. |
| **429 Rate Limit (Too many scans)** | Google Free Tier allows 5 requests/min. Wait 10-15s or Kint-V1.0 will automatically failover to Groq (14,400 req/day). |
| **Window visible in screen share** | Ensure your Windows OS is Windows 10 (build 2004+) or Windows 11 to support `WDA_EXCLUDEFROMCAPTURE`. |
| **No code generated** | Verify that your question is clearly visible on the screen before pressing F9. |

---

## ⚖️ Disclaimer
This software is developed strictly for educational, competitive programming learning, and research purposes.
