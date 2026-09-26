# ⚡ HackSolve — Complete User Guide & Instructions

Welcome to **HackSolve**, an invisible, high-performance competitive programming overlay designed for online coding assessments (HackerRank, LeetCode, Codeforces).

HackSolve uses **Windows Display Affinity (`WDA_EXCLUDEFROMCAPTURE`)**, making it **100% invisible** to screen-sharing software, including:
- **Microsoft Teams**
- **Google Meet**
- **Zoom**
- **Discord**
- **OBS Studio**
- **Browser Screen Sharing**

In addition, HackSolve runs with **Taskbar Invisibility (`WS_EX_TOOLWINDOW`)**, meaning no icon appears on the Windows Taskbar or Alt+Tab switcher.

---

## 📑 Table of Contents
1. [Initial Setup & Free API Keys](#1-initial-setup--free-api-keys)
2. [What To Do If Quota Is Exceeded (429 Rate Limit)](#2-what-to-do-if-quota-is-exceeded-429-rate-limit)
3. [How to Run](#3-how-to-run)
4. [Controls & Hotkey Cheat Sheet](#4-controls--hotkey-cheat-sheet)
5. [How Auto-Scroll Capture Works](#5-how-auto-scroll-capture-works)
6. [Multi-AI Failover Architecture](#6-multi-ai-failover-architecture)
7. [How to Shutdown & Reopen](#7-how-to-shutdown--reopen)
8. [Building the Standalone EXE](#8-building-the-standalone-exe)
9. [Troubleshooting & FAQ](#9-troubleshooting--faq)

---

## 1. Initial Setup & Free API Keys

HackSolve uses two free AI providers for maximum speed and 100% reliability:

### A. Get a Free Gemini API Key (1,500 Questions / Day)
1. Go to **[https://aistudio.google.com](https://aistudio.google.com)**
2. Sign in with your Google Account.
3. Click **"Get API Key"** in the top left corner.
4. Click **"Create API Key"** (in a new project).
5. Copy the generated key (starts with `AQ...` or `AI...`).

### B. Get a Free Groq API Key (14,400 Questions / Day — Blazing Fast)
1. Go to **[https://console.groq.com](https://console.groq.com)**
2. Sign in with Google or GitHub.
3. In the sidebar, click **"API Keys"** → **"Create API Key"**.
4. Give it a name (e.g., `HackSolve`) and copy the key (starts with `gsk_...`).

### C. Save Your Keys
You can save your keys into the `.env` file located in the `HackSolve` directory:
```env
GEMINI_API_KEY=your_gemini_key_here
GROQ_API_KEY=your_groq_key_here
```
*(Alternatively, open HackSolve and click the **`[🔑 API Key]`** button on the top toolbar to paste and save them directly from the UI!)*

---

## 2. What To Do If Quota Is Exceeded (429 Rate Limit)

### Understanding the Free Tier Limits:
1. **Burst Limit (Per Minute)**:
   - Google AI Studio allows **5 requests per minute** on the free tier.
   - If you spam **F9** rapidly 5+ times in 10 seconds, Google temporarily pauses requests for **15-30 seconds**.
   - **Fix**: HackSolve has a built-in 5-second cooldown. If you see *"Please wait a few seconds"*, simply wait 10 seconds before scanning again.

2. **Daily Quota Exhaustion (Limit: 1,500 on Gemini / 14,400 on Groq)**:
   - If you have completed hundreds of problems and your daily quota is completely exhausted:

### How to Swap to a Fresh Key in 10 Seconds:
1. Open an Incognito/Private browser window.
2. Go to **[aistudio.google.com](https://aistudio.google.com)** and sign in with an **alternative or secondary Google Account**.
3. Click **"Get API Key"** → **"Create API Key"** and copy the new key.
4. On your screen, inside the HackSolve overlay:
   - Click the **`[🔑 API Key]`** button on the toolbar.
   - Paste the new key into the **Gemini API Key** field.
   - Click **`[🧪 Test Gemini]`** — it will display *"✓ Key is VALID and active!"* in green.
   - Click **`[💾 Save All Keys]`**.
5. **Done!** HackSolve immediately activates the new quota in memory and updates `.env`. You do **NOT** need to restart the application!

---

## 3. How to Run

### Method 1: Quick Administrator Launcher (Recommended)
Right-click **`run.bat`** and choose **"Run as administrator"**.

### Method 2: From PowerShell or CMD
Open PowerShell as Administrator in the project directory:
```powershell
python main.py
```

> ⚠️ **CRITICAL**: Always run as **Administrator**. Windows security prevents background global hotkeys (**F9**, **F10**, **Ctrl+Shift+Q**) from hooking when you are focused on other windows (like Chrome or HackerRank) unless HackSolve has administrative privileges.

---

## 4. Controls & Hotkey Cheat Sheet

| Key / Button | Action | Purpose |
| :--- | :--- | :--- |
| **`F9`** | **Scan, Solve & Copy** | Scans question on screen (**Mouse blinks 1x**), solves in Java 17+, **automatically copies code to clipboard** (**Mouse blinks 2x**). Paste directly with `Ctrl+V`! |
| **`Ctrl` + `1`** | **API Key Manager** | Instantly opens the stealth Multi-AI key manager modal to change or test Gemini/Groq keys. |
| **`F10`** | **HUD / Settings Toggle** | Reveals or hides the full GUI overlay (for reading detailed notes, complexity, or setting keys). |
| **`Ctrl` + `Shift` + `Q`** | **Emergency Exit** | Immediately kills the background process and exits cleanly. |
| **`[📜 Scroll: ON/OFF]`** | **Toggle Auto-Scroll** | Turns 3-frame auto-scroll capture ON or OFF. |
| **`[🔑 API Key]`** | **Key Manager** | Opens stealth modal to test and switch Gemini / Groq API keys. |
| **`[📋 Copy Code]`** | **Copy Solution** | Copies clean Java solution directly to your clipboard. |
| **`[👁 95%]`** | **Opacity Cycle** | Toggles HUD transparency (95% → 85% → 70% → 50%). |
| **`▲ / ▼`** (or **`Esc`**) | **Fold HUD** | Collapses the overlay into a thin 38px top status bar. |
| **Header Drag** | **Move Window** | Click and drag the top title bar to reposition the overlay anywhere on your screen. |
| **`✕`** | **Close** | Exits application. |

---

## 5. How Auto-Scroll Capture Works

Many HackerRank and LeetCode problems are tall and do not fit in a single screen view.

When **`[📜 Scroll: ON]`** is enabled (default):
1. When you press **`F9`**, HackSolve automatically moves the virtual cursor over the **problem description pane** (left 35% of the screen).
2. It captures the top view, smoothly scrolls down, captures middle and bottom views (3 frames total).
3. It stitches the frames vertically into one seamless tall image, removing duplicate browser navigation bars.
4. It smoothly scrolls back up to your original reading position and returns your mouse cursor exactly where you left it.

---

## 6. Multi-AI Failover Architecture

HackSolve connects to a multi-tiered failover cascade:

```
                  ┌───────────────────────┐
                  │    User presses F9    │
                  └───────────┬───────────┘
                              │
               ┌──────────────┴──────────────┐
               ▼                             ▼
       [Native Windows OCR]         [Stitched Screenshot]
        (winocr Engine)             (Multimodal Vision)
               │                             │
               └──────────────┬──────────────┘
                              │
                              ▼
                ┌───────────────────────────┐
                │   Priority 1: Gemini AI   │
                │   (Multimodal Vision)     │
                │   Directly sees image     │
                └─────────────┬─────────────┘
                              │
                (If timeout/429/503 > 5s)
                              │
                              ▼
                ┌───────────────────────────┐
                │    Priority 2: Groq LPU   │
                │    (openai/gpt-oss-120b)  │
                │    14,400 free reqs/day   │
                │    Ultra-fast (< 1.0s)    │
                └─────────────┬─────────────┘
                              │
                (If Groq error > 5s)
                              │
                              ▼
                ┌───────────────────────────┐
                │   Priority 3: OpenRouter  │
                │   (Free Tier Fallback)    │
                └───────────────────────────┘
```

- **Gemini Multimodal Vision (`gemini-3.6-flash`)** directly examines the visual screenshot, reading complex mathematical notation, sample input/output tables, and function signatures without OCR flaws.
- **Groq LPU (`openai/gpt-oss-120b`)** provides lightning-fast (< 1.0s) backup solving using Windows Native OCR text.

---

## 7. How to Shutdown & Reopen

### To Shutdown (Exit):
- **Fastest**: Press **`Ctrl` + `Shift` + `Q`** anywhere on your keyboard.
- **Visual**: Click the red **`✕`** button on the top right of the HackSolve HUD.
- **Via Task Manager**: Press `Ctrl + Shift + Esc` → Find `HackSolve.exe` under Background Processes → Right-click → **End task**.

### To Reopen:
- Right-click **`run.bat`** → **Run as administrator** (or right-click `dist\HackSolve.exe` → **Run as administrator**).
- All your previously saved API keys and preferences are preserved automatically.

---

## 8. Building the Standalone EXE

To compile a single `.exe` file that can be copied to any Windows PC:

1. Double-click **`build.bat`**.
2. PyInstaller will compile all dependencies, the stealth Win32 hooks, and native OCR into:
   ```
   dist\HackSolve.exe
   ```
3. To run: Right-click `dist\HackSolve.exe` → **Run as administrator**.

> **Note**: The compiled `.exe` uses `--noconsole`, meaning **NO command prompt window** will ever appear. Combined with `WS_EX_TOOLWINDOW`, **NO taskbar icon** appears either.

---

## 9. Troubleshooting & FAQ

#### Q: HackSolve says "Hotkey Warning: Could not hook F9"
- **Solution**: You must launch the program as **Administrator**. Close it, right-click `run.bat` (or `HackSolve.exe`), and select **Run as administrator**.

#### Q: I pressed F9 and it says "Rate limit reached. Please wait 15 seconds"
- **Solution**: You triggered more than 5 scans in one minute. Wait 15 seconds for Google's burst cooldown to expire. If you need unlimited fast scans, make sure your Groq API key is configured.

#### Q: Can proctoring software (Proctor360, Mettl, Mercer, HackerRank Screen Share) see HackSolve?
- **Solution**: No. HackSolve utilizes the kernel-level Windows API `SetWindowDisplayAffinity(hwnd, 0x11)` (`WDA_EXCLUDEFROMCAPTURE`). When any screen capture tool requests the desktop frame buffer from Windows Graphics Device Interface (GDI) or Desktop Duplication API (DXGI), Windows automatically excludes the HackSolve window from the captured video feed.

#### Q: Someone is walking behind me during an exam!
- **Solution**: Press **`F10`** immediately. The entire HUD instantly vanishes from your screen. When the coast is clear, press **`F10`** again to restore it.
