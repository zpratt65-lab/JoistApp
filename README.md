# JoistApp

A **React Native / Expo** mobile application for steel joist selection, powered by the [JoistAPI](https://github.com/zpratt65-lab/JoistAPI) backend. Allows structural engineers and estimators to quickly calculate joist designations in the field using ASD or LRFD design methodology.

---

## Overview

JoistApp provides a clean mobile interface for entering structural parameters and retrieving joist recommendations from the JoistAPI backend. Results include the joist designation, self-weight, bridging requirements, bearing seat depth, and total safe load capacity.

---

## Tech Stack

| Component | Technology |
|-----------|-----------|
| Framework | React Native (Expo) |
| Language | JavaScript (ES6+) |
| UI | React Native core components |
| API Communication | Fetch API |
| Backend | [JoistAPI](https://github.com/zpratt65-lab/JoistAPI) |

---

## Getting Started

### Prerequisites

- [Node.js](https://nodejs.org/) ≥ 16
- [Expo CLI](https://docs.expo.dev/get-started/installation/)
- iOS Simulator, Android Emulator, or [Expo Go](https://expo.dev/client) on a physical device

### Installation

```bash
git clone https://github.com/zpratt65-lab/JoistApp.git
cd JoistApp
npm install
```

### Running the App

```bash
npx expo start
```

Scan the QR code with Expo Go, or press `i` for iOS simulator / `a` for Android emulator.

---

## Configuration

Create a `.env` file in the project root (or set variables in your Expo environment):

```env
EXPO_PUBLIC_API_HOST=https://joisttool.onrender.com
EXPO_PUBLIC_API_KEY=your-api-key-here
```

| Variable | Description | Default |
|----------|-------------|---------|
| `EXPO_PUBLIC_API_HOST` | JoistAPI base URL | `https://joisttool.onrender.com` |
| `EXPO_PUBLIC_API_KEY` | API key for authentication | `dev-key-change-in-production` |

> ⚠️ **Important:** Do not commit your `.env` file. Add it to `.gitignore`.

---

## Usage

Fill in the following fields and tap **Calculate Joist**:

| Field | Description |
|-------|-------------|
| Joist Series | Series type (e.g. `K`) |
| Design Methodology | `ASD` or `LRFD` |
| Span (ft) | Joist span in feet |
| Dead Load (psf) | Dead load in pounds per square foot |
| Live Load (psf) | Live load in pounds per square foot |
| Joist Spacing (ft) | Center-to-center joist spacing in feet |

### Example Output

```
Designation:      16K3
Self-weight:      6.5 PLF
Bridging Rows:    3
Min Bearing Seat: 2.5 in
Total Safe Load:  350 PLF
```

---

## API Integration

The app communicates with JoistAPI via a single `POST /calculate-joist` request:

```js
fetch(`${HOST}/calculate-joist`, {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'X-API-Key': API_KEY
  },
  body: JSON.stringify({ ... })
});
```

See the [JoistAPI README](https://github.com/zpratt65-lab/JoistAPI) for full request/response documentation.

---

## License

MIT