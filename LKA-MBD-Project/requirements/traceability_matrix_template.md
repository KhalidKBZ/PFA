# Requirements Traceability Matrix

This document provides a template for the requirements traceability matrix.

## Purpose

The traceability matrix links:
- Requirements → Hazards/Safety Goals
- Requirements → Design Components
- Requirements → Test Cases
- Requirements → Verification Status

---

## Traceability Matrix Template

| Req ID | Requirement Text | Type | Hazard/Safety Goal | Design Component | Test Case ID | Verification Status | Notes |
|--------|-----------------|------|-------------------|------------------|--------------|---------------------|-------|
| FR-001 | Lane detection ≥95% accuracy | Functional | SG-003 | Perception Module | TC-P-001 | 🟡 Pending | |
| FR-002 | Lateral deviation ≤5cm accuracy | Functional | SG-003 | Perception Module | TC-P-002 | 🟡 Pending | |
| FR-003 | Generate steering commands | Functional | SG-001 | Control Module | TC-C-001 | 🟡 Pending | |
| FR-004 | Activate 60-130 km/h | Functional | SG-004 | State Machine | TC-S-001 | 🟡 Pending | |
| FR-005 | Deactivate speed hysteresis | Functional | SG-004 | State Machine | TC-S-002 | 🟡 Pending | |
| FR-006 | Driver override <50ms | Functional | SG-002 | State Machine | TC-S-003 | 🟡 Pending | |
| FR-007 | System status feedback | Functional | - | HMI Module | TC-U-001 | 🟡 Pending | |
| PR-001 | Update rate ≥20 Hz | Performance | - | All Modules | TC-P-003 | 🟡 Pending | |
| PR-002 | Latency <100ms | Performance | SG-001 | System Integration | TC-P-004 | 🟡 Pending | |
| PR-003 | Lateral error ≤0.3m (95%) | Performance | SG-001 | Control Module | TC-P-005 | 🟡 Pending | |
| PR-004 | Steering rate ≤30 deg/s | Performance | - | Actuation Module | TC-P-006 | 🟡 Pending | |
| SR-001 | Fail-safe on lost lanes | Safety | SG-001 | Safety Monitor | TC-S-004 | 🟡 Pending | |
| SR-002 | Driver override always available | Safety | SG-002 | State Machine | TC-S-003 | 🟡 Pending | |
| SR-003 | Monitor steering torque | Safety | SG-001 | Safety Monitor | TC-S-005 | 🟡 Pending | |
| SR-004 | Graceful degradation | Safety | SG-004 | State Machine | TC-S-006 | 🟡 Pending | |
| TSR-001 | Limit torque ±5 Nm | Technical Safety | SG-001 | Control Module | TC-S-007 | 🟡 Pending | |
| TSR-002 | Monitor torque continuously | Technical Safety | SG-001 | Safety Monitor | TC-S-008 | 🟡 Pending | |
| TSR-003 | Deactivate if torque >5.5 Nm | Technical Safety | SG-001 | Safety Monitor | TC-S-009 | 🟡 Pending | |
| TSR-004 | Monitor confidence <70% | Technical Safety | SG-001 | Safety Monitor | TC-S-010 | 🟡 Pending | |
| TSR-005 | Monitor driver torque ≥50Hz | Technical Safety | SG-002 | Safety Monitor | TC-S-011 | 🟡 Pending | |
| TSR-006 | Deactivate if driver >3 Nm | Technical Safety | SG-002 | State Machine | TC-S-003 | 🟡 Pending | |
| TSR-007 | Override precedence | Technical Safety | SG-002 | State Machine | TC-S-012 | 🟡 Pending | |

---

## Verification Status Legend

- ✅ **Verified**: Requirement has been verified
- 🟡 **Pending**: Verification not yet completed
- ❌ **Failed**: Verification failed, needs rework
- 🔄 **In Progress**: Verification currently in progress

---

## Test Case Naming Convention

- **TC-P-XXX**: Perception module tests
- **TC-C-XXX**: Control module tests
- **TC-S-XXX**: Safety/Safety Monitor tests
- **TC-I-XXX**: Integration tests
- **TC-U-XXX**: User interface tests
- **TC-SYS-XXX**: System-level tests

---

## Design Component Mapping

| Component | Modules | Files |
|-----------|---------|-------|
| Perception Module | Lane Detection | `models/perception/Perception_LaneDetection.slx` |
| Control Module | PID Controller, MPC Controller | `models/control/Controller_PID.slx`, `models/control/Controller_MPC.slx` |
| Safety Monitor | Safety Checks, Fault Detection | `models/safety_monitor/Safety_Monitor.slx` |
| State Machine | Mode Management | `models/integration/LKA_StateMachine.slx` |
| Actuation Module | Command Limiting | `models/integration/LKA_Actuation.slx` |

---

## Notes

- This matrix should be updated continuously throughout the project
- Each requirement must have at least one test case
- Safety requirements must trace to safety goals
- All requirements must be verified before project completion

---

**Document Version**: 1.0  
**Last Updated**: November 2025  
**Status**: 🟡 In Progress

