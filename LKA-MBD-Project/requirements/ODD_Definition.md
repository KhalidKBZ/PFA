# Operational Design Domain (ODD) Definition

**Document Version**: 1.0  
**Last Updated**: November 2025  
**Project**: Lane Keeping Assist (LKA) System

---

## 1. Purpose

This document defines the **Operational Design Domain (ODD)** for the Lane Keeping Assist system. The ODD specifies the conditions under which the system is designed to function safely and effectively.

---

## 2. ODD Boundaries

### 2.1 Where LKA Works ✅

The LKA system is designed to operate in the following conditions:

#### Road Type
- ✅ **Highway roads** with clear lane markings
- ✅ **Well-maintained roads** with visible lane boundaries
- ✅ **Multi-lane highways** with standard lane widths (3.5-3.7m)

#### Lane Markings
- ✅ **Clear, visible lane markings** (white or yellow)
- ✅ **Continuous lane markings** (solid or dashed)
- ✅ **Standard lane marking width** (10-15cm)
- ✅ **Good contrast** between markings and road surface

#### Environmental Conditions
- ✅ **Daylight conditions** (sunny, overcast)
- ✅ **Well-lit conditions** (streetlights at night)
- ✅ **Clear visibility** (>100m ahead)
- ✅ **Dry road surface**

#### Road Geometry
- ✅ **Straight roads**
- ✅ **Gentle curves** with radius **>200m**
- ✅ **Standard lane width** (3.5-3.7m)
- ✅ **Moderate road grade** (<10% slope)

#### Speed Range
- ✅ **60-130 km/h** (highway speeds)
- ✅ **Stable speed** (no rapid acceleration/deceleration)

#### Traffic Conditions
- ✅ **Normal traffic flow**
- ✅ **Standard lane discipline**

---

### 2.2 Where LKA Does NOT Work ❌

The LKA system is **NOT** designed to operate in the following conditions:

#### Road Type
- ❌ **Urban streets** with frequent intersections
- ❌ **City driving** with complex road layouts
- ❌ **Residential areas** with narrow streets
- ❌ **Parking lots** and private roads
- ❌ **Unpaved roads** (gravel, dirt)
- ❌ **Construction zones** with temporary markings

#### Lane Markings
- ❌ **No lane markings** or unclear markings
- ❌ **Faded or worn markings** (<50% visibility)
- ❌ **Temporary or non-standard markings**
- ❌ **Conflicting markings** (multiple lane lines)
- ❌ **Markings covered** by snow, debris, or paint

#### Environmental Conditions
- ❌ **Heavy rain** (reduced visibility, water on road)
- ❌ **Snow** (covered markings, reduced visibility)
- ❌ **Fog** (visibility <100m)
- ❌ **Severe weather** (storms, hail)
- ❌ **Night driving** without adequate lighting
- ❌ **Direct sunlight** causing glare on camera

#### Road Geometry
- ❌ **Sharp curves** with radius **<200m**
- ❌ **Tight turns** (>30 degrees)
- ❌ **Steep grades** (>10% slope)
- ❌ **Narrow lanes** (<3.0m width)
- ❌ **Merging lanes** or lane splits
- ❌ **Toll plazas** or checkpoints

#### Speed Range
- ❌ **Speeds <60 km/h** (too slow for highway operation)
- ❌ **Speeds >130 km/h** (beyond design limits)
- ❌ **Rapid speed changes** (emergency braking/acceleration)

#### Traffic Conditions
- ❌ **Heavy traffic** with frequent lane changes
- ❌ **Emergency situations** (accidents, breakdowns)
- ❌ **Construction zones** with lane closures
- ❌ **Toll booths** or checkpoints

---

## 3. ODD Validation

### 3.1 Entry Conditions

The LKA system **SHALL** only activate when ALL of the following conditions are met:

1. ✅ Vehicle speed: **60-130 km/h**
2. ✅ Lane markings detected with **≥70% confidence**
3. ✅ Road geometry within limits (curvature **>200m**)
4. ✅ Environmental conditions suitable (clear visibility)
5. ✅ System health checks passed
6. ✅ Driver has activated LKA (manual activation)

### 3.2 Exit Conditions

The LKA system **SHALL** deactivate when ANY of the following conditions occur:

1. ❌ Vehicle speed **<55 km/h** or **>135 km/h** (hysteresis)
2. ❌ Lane markings lost for **>2 seconds**
3. ❌ Lane detection confidence **<70%** for **>1 second**
4. ❌ Road curvature **<200m** detected
5. ❌ Driver override (steering torque **>3 Nm**)
6. ❌ System fault detected
7. ❌ Manual deactivation by driver

### 3.3 Transition Warnings

The LKA system **SHALL** provide warnings when approaching ODD boundaries:

- ⚠️ **5 seconds before** speed limit (approaching 60 km/h or 130 km/h)
- ⚠️ **3 seconds before** lane marking loss (confidence dropping)
- ⚠️ **2 seconds before** curve limit (approaching <200m radius)
- ⚠️ **Immediate warning** on system fault

---

## 4. ODD Testing Scenarios

### 4.1 Valid Scenarios (Should Work)

| Scenario | Description | Expected Behavior |
|----------|-------------|-------------------|
| S-001 | Straight highway, 100 km/h, clear markings | ✅ System active, maintains lane center |
| S-002 | Gentle curve (R=300m), 80 km/h | ✅ System active, tracks curve |
| S-003 | Speed transition 70→90 km/h | ✅ System remains active |
| S-004 | Clear day, good visibility | ✅ System active, high confidence |

### 4.2 Invalid Scenarios (Should NOT Work)

| Scenario | Description | Expected Behavior |
|----------|-------------|-------------------|
| S-101 | Urban street, 50 km/h | ❌ System inactive (speed too low) |
| S-102 | Sharp curve (R=100m) | ❌ System deactivates (curvature limit) |
| S-103 | Heavy rain, poor visibility | ❌ System deactivates (ODD exit) |
| S-104 | No lane markings | ❌ System inactive (no detection) |
| S-105 | Construction zone | ❌ System deactivates (invalid markings) |

---

## 5. ODD Monitoring

The system continuously monitors ODD conditions:

- **Speed monitoring**: Continuous (≥20 Hz)
- **Lane detection confidence**: Continuous (≥20 Hz)
- **Road curvature**: Continuous (≥20 Hz)
- **Environmental conditions**: Continuous (via camera)
- **System health**: Continuous (≥20 Hz)

---

## 6. ODD Documentation in Requirements

This ODD definition is linked to:

- **FR-004**: Speed-based activation (60-130 km/h)
- **FR-005**: Speed-based deactivation
- **SR-001**: Fail-safe on lost lanes
- **H-003**: LKA activates in inappropriate conditions
- **SG-003**: Prevent activation in inappropriate conditions

---

## 7. Assumptions

1. **Camera sensor** provides reliable image data within ODD
2. **Vehicle dynamics** are within normal operating range
3. **Driver** is attentive and ready to take control
4. **Road infrastructure** follows standard highway design
5. **Weather conditions** are monitored and reported accurately

---

## 8. Limitations

This ODD definition is based on:

- **Simulation environment** (CarMaker/CARLA)
- **Student project constraints** (no real-world testing)
- **Standard highway scenarios** (not all edge cases covered)
- **Theoretical analysis** (not validated with real vehicle)

---

## 9. Revision History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | Nov 2025 | Team | Initial ODD definition |

---

**Document Status**: ✅ Approved | 🟡 Pending Approval | ❌ Rejected

**Next Review Date**: _______________

