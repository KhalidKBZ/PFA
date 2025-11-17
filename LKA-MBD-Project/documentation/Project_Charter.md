# Project Charter: Lane Keeping Assist (LKA) System

**Project Name:** Lane Keeping Assist (LKA) System - Model-Based Design  
**Date:** November 2025  
**Version:** 1.0

---

## 1. Project Scope

### 1.1 In Scope

Develop a **Lane Keeping Assist system** for highway driving that:

- Operates at speeds between **60-130 km/h**
- Maintains vehicle position within **±0.3m of lane center** with **95% reliability**
- Handles:
  - Straight roads
  - Gentle curves (radius >200m)
- Provides graceful deactivation on:
  - System failures
  - Driver override
  - Operational domain exit

### 1.2 Out of Scope

The following are explicitly **NOT** part of this project:

- ❌ Sharp curves (radius <200m)
- ❌ Urban/city driving scenarios
- ❌ Construction zones with no lane markings
- ❌ Adverse weather conditions (heavy rain, snow, fog)
- ❌ Multi-lane changes
- ❌ Speeds below 60 km/h or above 130 km/h
- ❌ Unpaved roads
- ❌ Night driving without adequate lighting

---

## 2. Success Criteria

The project will be considered successful if all of the following criteria are met:

| Criterion | Target | Measurement Method |
|-----------|--------|-------------------|
| **Lateral Error** | <0.3m in 95% of test cases | Statistical analysis of test results |
| **System Latency** | <100ms end-to-end | Timing analysis from sensor input to actuator output |
| **Safe Deactivation** | 100% success in all fault scenarios | Fault injection testing |
| **Safety Analysis** | Complete ISO 26262-inspired analysis | HARA, FMEA, FTA documentation |
| **Test Coverage** | >85% automated test suite coverage | Simulink Coverage analysis |
| **Documentation** | Professional documentation package | Deliverable checklist |

---

## 3. Constraints

### 3.1 Hardware Constraints
- **Development PCs only** - No physical ECU available
- Simulation-based development and testing

### 3.2 Sensor Constraints
- **Camera sensor** (simulated in CarMaker)
- No additional sensors (no LiDAR, radar, etc.)

### 3.3 Timeline
- **12 weeks** total project duration
- Phased delivery approach

### 3.4 Budget
- **Student licenses only**
- Open-source tools where possible
- No commercial tool purchases

### 3.5 Technical Constraints
- Must use Model-Based Design methodology
- Must follow ISO 26262-inspired safety process
- Must produce traceable requirements

---

## 4. Deliverables

### 4.1 Phase 0 (Week 1) - Setup
- ✅ Git repository initialized with proper structure
- ✅ All tools installed and verified
- ✅ Project charter signed off
- ✅ Team roles confirmed
- ✅ Communication channels established

### 4.2 Phase 1 (Week 2) - Requirements
- ✅ System Requirements Document (10-15 requirements)
- ✅ HARA table with ASIL assignments
- ✅ Safety Goals and Technical Safety Requirements
- ✅ Requirements Traceability Matrix (initial version)
- ✅ Operational Design Domain (ODD) definition

### 4.3 Phase 2 (Week 3) - Architecture
- ✅ High-Level System Architecture diagram
- ✅ Interface Control Document (ICD)
- ✅ State Machine Design (Stateflow)
- ✅ Module specifications

### 4.4 Phase 3-4 (Weeks 4-8) - Implementation
- ✅ Perception module (lane detection)
- ✅ Control module (PID → MPC)
- ✅ Safety monitor module
- ✅ State machine implementation
- ✅ Integration model

### 4.5 Phase 5 (Weeks 9-10) - Testing
- ✅ Unit test suite (MIL)
- ✅ Integration test suite
- ✅ System test suite
- ✅ Test coverage reports
- ✅ Performance validation

### 4.6 Phase 6 (Weeks 11-12) - Documentation
- ✅ System Requirements Specification
- ✅ Software Architecture Document
- ✅ Verification & Validation Report
- ✅ Safety Analysis Report
- ✅ User Manual
- ✅ Final presentation

---

## 5. Project Approach

### 5.1 Methodology
- **V-Model** development process
- **Model-Based Design** (MBD) approach
- **ISO 26262-inspired** safety engineering
- **Agile iterations** within each phase

### 5.2 Development Principles
- ✅ **Traceability**: Every requirement linked to design, implementation, and tests
- ✅ **Safety First**: Safety analysis drives design decisions
- ✅ **Automation**: Automated testing and validation where possible
- ✅ **Documentation**: Professional documentation throughout
- ✅ **Iterative**: Get to working demo FAST, then iterate

### 5.3 Quality Assurance
- Code reviews for all models
- Automated test execution
- Coverage analysis
- Requirements verification
- Safety validation

---

## 6. Risk Management

### 6.1 Technical Risks

| Risk | Impact | Mitigation |
|------|--------|------------|
| CarMaker license unavailable | High | Use CARLA as fallback |
| Toolbox license issues | Medium | Use alternative implementations or request student licenses |
| Complex MPC tuning | Medium | Start with PID, iterate to MPC |
| Lane detection accuracy | High | Use proven algorithms, extensive testing |

### 6.2 Schedule Risks

| Risk | Impact | Mitigation |
|------|--------|------------|
| Delays in tool setup | Medium | Start early, have fallback options |
| Integration issues | High | Regular integration testing |
| Documentation delays | Low | Document as you go |

---

## 7. Team Structure

### 7.1 Roles

**Person 1: Systems & Safety Engineer**
- Leads requirements, HARA, safety analysis
- Maintains traceability matrix
- Coordinates documentation and final deliverables

**Person 2: Control & Algorithm Engineer**
- Designs system architecture
- Implements control algorithms (PID → MPC)
- Develops perception module

**Person 3: Test & Integration Engineer**
- Sets up CarMaker-Simulink co-simulation
- Creates test scenarios and automation scripts
- Performs all V&V activities

### 7.2 Collaboration
- **Note**: Roles overlap during implementation - everyone codes, everyone tests
- Weekly team meetings
- Daily stand-ups (brief)
- Shared Git repository with clear branching strategy

---

## 8. Communication Plan

- **Repository**: Git with clear commit messages
- **Meetings**: Weekly team meetings
- **Documentation**: Shared documentation folder
- **Issues**: Use Git issues for tracking

---

## 9. Approval

This project charter defines the scope, objectives, and approach for the LKA Model-Based Design project.

**Approved by:**
- [ ] Person 1 (Systems & Safety Engineer)
- [ ] Person 2 (Control & Algorithm Engineer)
- [ ] Person 3 (Test & Integration Engineer)

**Date:** _______________

---

## 10. Revision History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | Nov 2025 | Team | Initial charter |

---

**Document Status:** ✅ Approved | 🟡 Pending Approval | ❌ Rejected

