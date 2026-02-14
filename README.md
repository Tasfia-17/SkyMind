# 🚁 SkyMind AI - Autonomous Drone Fleet Orchestrator

> AI-powered drone fleet coordination platform for warehouse operations  
> Built for [lablab.ai AI Meets Robotics Hackathon](https://lablab.ai/event/launch-fund-ai-meets-robotics)

[![Demo](https://img.shields.io/badge/Demo-Live-success)](https://mujoco-wasm.vercel.app/)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Hackathon](https://img.shields.io/badge/Hackathon-AI%20Meets%20Robotics-orange)](https://lablab.ai/event/launch-fund-ai-meets-robotics)

![SkyMind AI Banner](./thumbnail.png)

---

## 🎯 Overview

**SkyMind AI** is a versatile robotics simulation and AI orchestration platform. While optimized for autonomous drone fleet coordination in warehouse operations, the platform supports multiple robotics scenarios including quadrupeds, humanoids, and manipulators.

### The Problem
Modern robotics deployments (drones, ground robots, manipulators) need centralized AI coordination that adapts to real-time conditions like battery levels, obstacles, and mission priorities. Testing these systems on real hardware is expensive and risky.

### Our Solution
- **🤖 Gemini AI** for intelligent mission planning with explainable reasoning
- **☁️ Vultr Backend** as central coordination layer for any robot type
- **⚙️ MuJoCo Simulation** for physics-accurate digital twin validation
- **📊 Live Dashboard** showing real-time AI decisions and telemetry

**Primary Use Case:** Autonomous warehouse drone fleet management  
**Platform Capability:** Extensible to any MuJoCo-compatible robot

---

## ✨ Key Features

### 🧠 Transparent AI Decision-Making
Every action is explained in natural language. No black box - operators understand why drones make specific choices.

### 🎮 Real-Time Physics Simulation
Browser-based MuJoCo engine running at 60 FPS with multiple robotics scenarios:
- Aerial vehicles (drones with PID control)
- Legged robots (quadrupeds, bipeds)
- Manipulators (robotic arms, hands)
- Multi-agent coordination

### 📡 Cloud Coordination
Vultr-powered backend logs all telemetry, stores mission history, and coordinates fleet operations.

### 🎯 Production-Ready Architecture
Built like a real SaaS platform with REST APIs, database persistence, and scalable infrastructure.

---

## 🎥 Demo

**[▶️ Watch Demo Video](YOUR_YOUTUBE_LINK)**

**[🌐 Try Live Demo](https://sky-mind-nine.vercel.app/)**

### Example Scenes

<table>
  <tr>
    <td width="50%">
      <img src="docs/images/skydio-x2-demo.png" alt="Skydio X2 Drone" />
      <p align="center"><strong>Skydio X2 Quadcopter</strong><br/>Autonomous drone with PID control</p>
    </td>
    <td width="50%">
      <img src="docs/images/unitree-go1-demo.png" alt="Unitree GO1" />
      <p align="center"><strong>Unitree GO1 Robot</strong><br/>Quadruped locomotion</p>
    </td>
  </tr>
</table>

### Available Robotics Scenarios

- **🚁 Aerial Robots:** Skydio X2 drone with autonomous flight control
- **🐕 Quadrupeds:** Boston Dynamics Spot, Unitree GO1
- **🤖 Humanoids:** Bipedal robots, 22-humanoid crowd simulation
- **🦾 Manipulators:** Shadow Hand, robotic arms
- **🔬 Multi-Agent:** Combined drone + Spot coordination
- **⚙️ Physics Demos:** Balloons, flags, adhesion, tendons

---

## 🏗 Architecture

```
┌──────────────────┐
│  Browser Client  │  MuJoCo WASM + Three.js
│  (Simulation)    │  Sends telemetry every 1s
└────────┬─────────┘
         │ REST API
         ▼
┌──────────────────┐
│  Vultr Backend   │  Node.js + Express + SQLite
│  (Coordination)  │  Central system of record
└────────┬─────────┘
         │ Gemini API
         ▼
┌──────────────────┐
│  Google Gemini   │  AI mission planning
│  (Intelligence)  │  Explainable reasoning
└────────┬─────────┘
         │ Decision
         ▼
┌──────────────────┐
│  Live Dashboard  │  Real-time monitoring
│  (Monitoring)    │  AI decision display
└──────────────────┘
```

---

## 🚀 Quick Start

### Prerequisites
- Node.js 20+
- Python 3 (for local server)
- Vultr account
- Gemini API key ([Get free key](https://aistudio.google.com/app/apikey))

### 1. Clone Repository
```bash
git clone https://github.com/Tasfia-17/SkyMind.git
cd SkyMind
```

### 2. Deploy Backend to Vultr
```bash
# SSH into your Vultr VM
ssh root@YOUR_VULTR_IP

# Upload backend files
scp -r backend/* root@YOUR_VULTR_IP:/var/www/skymind-backend/

# Run setup script
cd /var/www/skymind-backend
chmod +x setup.sh
./setup.sh

# Start server
npm install
pm2 start server.js --name skymind
pm2 startup && pm2 save
```

**Detailed deployment guide:** [docs/HACKATHON_SUBMISSION_GUIDE.md](docs/HACKATHON_SUBMISSION_GUIDE.md)

### 3. Run Frontend Locally
```bash
cd mujoco_wasm
python -m http.server 8000
```

Open http://localhost:8000 in your browser.

### 4. Configure Backend URL
Edit `frontend/skymind-ai/skymind-ai.js`:
```javascript
const BACKEND_URL = 'http://YOUR_VULTR_IP:3000';
```

---

## 📁 Project Structure

```
SkyMind/
├── backend/                    # Vultr backend
│   ├── server.js              # Node.js API + Gemini integration
│   ├── package.json           # Dependencies
│   ├── setup.sh               # Automated Vultr setup
│   └── README.md              # Backend deployment guide
│
├── frontend/                   # Frontend integration
│   └── skymind-ai/
│       ├── dashboard.html     # Live dashboard UI
│       ├── skymind-ai.js      # AI integration module
│       └── INTEGRATION_GUIDE.js  # Integration instructions
│
├── mujoco_wasm/               # MuJoCo simulation
│   ├── examples/              # Simulation scenes
│   │   ├── skydio_x2/        # Drone simulation
│   │   └── combined_drone_spot/  # Multi-agent
│   ├── src/                   # WASM source
│   └── index.html             # Main entry point
│
├── docs/                       # Documentation
│   ├── HACKATHON_SUBMISSION_GUIDE.md  # Complete guide
│   └── QUICK_REFERENCE.txt    # Quick reference
│
└── README.md                   # This file
```

---

## 🎮 Controls

### Drone Control
- **W/S** - Pitch forward/backward
- **A/D** - Roll left/right
- **Space** - Increase altitude
- **Z** - Decrease altitude

### Camera
- **C** - Cycle camera modes
- **Mouse** - Orbit camera
- **Scroll** - Zoom

### AI Control
- **Dashboard Toggle** - Switch between AI and manual mode

---

## 📡 API Endpoints

### `POST /telemetry`
Send drone state to backend.

```bash
curl -X POST http://YOUR_VULTR_IP:3000/telemetry \
  -H "Content-Type: application/json" \
  -d '{
    "drone_id": "drone_1",
    "position": {"x": 1.5, "y": 2.0, "z": 3.0},
    "battery": 85,
    "status": "active"
  }'
```

### `POST /mission`
Get AI decision from Gemini.

```bash
curl -X POST http://YOUR_VULTR_IP:3000/mission \
  -H "Content-Type: application/json" \
  -d '{
    "drone_id": "drone_1",
    "position": {"x": 1.5, "y": 2.0, "z": 3.0},
    "battery": 85,
    "velocity": {"x": 0.1, "y": 0, "z": 0},
    "obstacles": []
  }'
```

**Response:**
```json
{
  "action": "patrol",
  "target": {"x": 5.0, "y": 3.0, "z": 2.5},
  "reasoning": "Battery sufficient, continuing patrol route"
}
```

### `GET /stats`
Get dashboard statistics.

### `GET /history`
Get mission and telemetry history.

---

## 🛠 Tech Stack

**Frontend:**
- MuJoCo WASM - Physics simulation
- Three.js - 3D rendering
- Vanilla JavaScript - No framework bloat

**Backend:**
- Node.js + Express - API server
- SQLite - Telemetry database
- PM2 - Process management

**AI:**
- Google Gemini 2.0 Flash - Decision making
- Natural language reasoning
- JSON structured outputs

**Infrastructure:**
- Vultr Cloud Compute - Backend hosting
- Vercel - Frontend deployment
- GitHub - Version control

---

## 🏆 Hackathon Alignment

### Track 1: Autonomous Robotics Control ✅
- AI-driven decision making (not scripted)
- Adaptive behavior based on real-time state
- Multi-agent coordination capability

### Required Technologies ✅
- **Vultr** - Central backend and system of record
- **Gemini AI** - Mission planning and reasoning
- **Simulation** - MuJoCo physics engine
- **Web-based** - Accessible via browser

### Innovation ✅
- Transparent AI reasoning (not black box)
- Real-time coordination layer
- Digital twin validation
- Explainable autonomy

---

## 💼 Business Value

### Target Market
- Warehouse automation ($30B by 2026)
- Drone logistics (55% annual growth)
- Enterprise fleet management

### Value Proposition
- **Reduce costs** - Automated coordination vs manual
- **Increase safety** - Digital twin testing before deployment
- **Scale easily** - One AI brain for entire fleet
- **Debug faster** - Transparent AI reasoning

### Revenue Model
- SaaS subscription per drone
- Enterprise licenses for large fleets
- API access for integrations

---

## 📈 Future Roadmap

- [ ] Multi-drone collision avoidance
- [ ] Real-time obstacle detection
- [ ] Battery optimization algorithms
- [ ] Integration with real drone hardware
- [ ] Fleet analytics dashboard
- [ ] Mobile operator app
- [ ] Voice commands via Gemini

---

## 🤝 Contributing

We welcome contributions! Areas for improvement:
- New simulation scenarios
- Control system enhancements
- Dashboard features
- Documentation improvements

---

## 📄 License

MIT License - See [LICENSE](LICENSE) for details.

### Third-Party Components
- **MuJoCo** - Apache 2.0 (Google DeepMind)
- **Three.js** - MIT License
- **Node.js** - MIT License

---

## 🙏 Acknowledgments

- **lablab.ai** - Hackathon organizers
- **Google DeepMind** - Gemini AI and MuJoCo
- **Vultr** - Cloud infrastructure
- **Surge** - Funding opportunities

---

## 📞 Links

- **Live Demo:** https://mujoco-wasm.vercel.app/
- **Backend API:** `http://YOUR_VULTR_IP:3000`
- **Demo Video:** [YOUR_YOUTUBE_LINK]
- **X Post:** [YOUR_TWEET_URL]
- **Hackathon:** https://lablab.ai/event/launch-fund-ai-meets-robotics

---

## 👥 Team

Built by [@Tasfia-17](https://github.com/Tasfia-17)

**Original MuJoCo WASM Contributors:**
- [@AdvayIyer](https://github.com/AdvayIyer)
- [@k1a11220](https://github.com/k1a11220)

---

## 📖 Documentation

- **[Complete Submission Guide](docs/HACKATHON_SUBMISSION_GUIDE.md)** - Full deployment walkthrough
- **[Quick Reference](docs/QUICK_REFERENCE.txt)** - Quick start commands
- **[Backend README](backend/README.md)** - Backend deployment details
- **[Integration Guide](frontend/skymind-ai/INTEGRATION_GUIDE.js)** - Frontend integration

---

**Built with ❤️ for autonomous robotics and AI innovation**

🚁 **SkyMind AI** - Making drone fleets intelligent, transparent, and scalable
