# System Architecture Documentation

This folder contains the system architecture documentation for the LKA project.

## Contents

- **System Architecture Diagram**: High-level system architecture
- **Module Specifications**: Detailed specifications for each module
- **Interface Definitions**: Signal and data interfaces between modules

## System Architecture Overview

The LKA system follows a modular architecture with the following components:

1. **Perception Module**
   - Lane detection from camera input
   - Confidence scoring
   - Lateral deviation calculation

2. **Decision & Logic Module (Stateflow)**
   - System state machine
   - Mode management (OFF/STANDBY/ACTIVE/WARNING/FAIL)
   - Activation/deactivation logic

3. **Control Module**
   - PID controller (initial implementation)
   - MPC controller (advanced implementation)
   - Steering command generation

4. **Safety Monitor Module**
   - Plausibility checks
   - Fault detection
   - Fail-safe logic
   - Driver override detection

5. **Actuation Module**
   - Steering command limiting
   - Rate control
   - Final command output

## Interface Definitions

See `../interface_definitions/` for detailed interface specifications.

---

**Status**: 🟡 In Progress

