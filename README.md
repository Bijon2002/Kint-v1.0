# ⚡ HackSolve — Stealth Screen AI

**HackSolve** is an invisible, high-performance competitive programming overlay that reads coding questions directly from your screen (HackerRank, LeetCode, Codeforces) and delivers optimal Python 3 solutions in real time.

Built with **Windows Display Affinity (`WDA_EXCLUDEFROMCAPTURE`)**, making it **100% invisible** to screen-sharing tools including **Microsoft Teams, Google Meet, Zoom, OBS, and browser capture**.

---

## 🚀 Key Features

- **🛡️ 100% Background Stealth & Screen Share Invisibility**: Runs silently in the background and is completely invisible to recording/screen-sharing tools (**Teams, Zoom, Meet, OBS, Discord**) via `WDA_EXCLUDEFROMCAPTURE`.
- **⚡ Instant F9 Scan & Auto-Clipboard**: Press **`F9`** anywhere on your screen. HackSolve captures the question, solves it, and **automatically copies the clean Python 3 solution directly into your clipboard** ready to paste (`Ctrl+V`).
- **🔔 HP-Style On-Screen Notification Alert (OSD Pill)**: Displays a sleek, discreet floating capsule notification (similar to modern HP laptop OSD alerts) confirming the solution is ready and copied, along with the solver latency (e.g. `✓ Solution Copied to Clipboard! (Groq • 0.8s)`). The notification pill itself is also 100% invisible to screen share!
- **⚡ Multi-AI Provider Auto-Failover**:
  - **Groq LPU** (`openai/gpt-oss-120b`): Ultra-fast solver (< 0.8s) with a massive **14,400 free requests/day** limit.
  - **Gemini Multimodal Vision** (`gemini-3.6-flash`): Reads diagrams, constraints, code editor, and input/output samples from screenshots.
  - **5-Second Auto-Switching**: If any provider encounters a rate limit or timeout, HackSolve seamlessly switches to backup models.
- **📜 Auto-Scroll Capture & Stitching**:
  - Automatically scrolls the problem description pane top-to-bottom.
  - Captures 3 sequential viewpoints and stitches them into a single high-resolution image.
  - Smoothly restores your original scroll position and cursor location.
- **🔍 Native Windows 10/11 OCR (`winocr`)**:
  - Automatically extracts screen text using Windows' built-in OCR engine without requiring external Tesseract installations.
- **🖥️ On-Demand Full HUD (`F10`)**:
  - Need to read detailed time complexity, approach notes, or change API keys? Press **`F10`** to toggle the full stealth HUD overlay.

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
Or press **`F10`** to open the HUD and click **`[🔑 API Key]`** to paste, test, and save your keys.

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
| **Scan, Solve & Copy** | **F9** | Scans question (**Mouse blinks 1x**), solves optimal Java 17+ code, copies to clipboard (**Mouse blinks 2x**). Paste with `Ctrl+V`! |
| **API Key Manager** | **Ctrl + 1** | Instantly opens the stealth Multi-AI key manager to change or test Gemini/Groq keys |
| **HUD / Settings Toggle** | **F10** | Shows / hides the full GUI HUD overlay (for reading detailed notes or setting keys) |
| **Emergency Shutdown** | **Ctrl + Shift + Q** | Completely kills and closes the background application |
| **Toggle Auto-Scroll** | **[📜 Scroll: ON/OFF]** | Toggles multi-frame auto-scrolling vs. single screen capture |
| **Copy Solution Code** | **[📋 Copy Code]** | Copies clean, ready-to-submit Java solution to clipboard |
| **Cycle Opacity** | **[👁 95%]** | Cycles opacity: 95% → 85% → 70% → 50% |
| **Fold / Minimize** | **▲ / ▼** (or **Esc**) | Collapses HUD into a slim top status bar |
| **Move Window** | **Drag Header** | Drag top title bar to position the HUD anywhere |
| **Close** | **✕** | Exits application |

---

## 🏗️ Build Standalone EXE

To compile a single executable file:
1. Double-click **`build.bat`**  
   *OR* run:
   ```powershell
   pyinstaller --onefile --noconsole --name HackSolve main.py
   ```
2. The compiled binary will be located at `dist\HackSolve.exe`.
3. Right-click `dist\HackSolve.exe` → **Run as administrator**.

---

## ⚙️ Configuration Reference

All settings can be customized at the top of [main.py](file:///a:/HackSolve/main.py):

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
| **429 Rate Limit (Too many scans)** | Google Free Tier allows 5 requests/min. Wait 10-15s or HackSolve will automatically failover to Groq (14,400 req/day). |
| **Window visible in screen share** | Ensure your Windows OS is Windows 10 (build 2004+) or Windows 11 to support `WDA_EXCLUDEFROMCAPTURE`. |
| **No code generated** | Verify that your question is clearly visible on the screen before pressing F9. |

---

## ⚖️ Disclaimer
This software is developed strictly for educational, competitive programming learning, and research purposes.
