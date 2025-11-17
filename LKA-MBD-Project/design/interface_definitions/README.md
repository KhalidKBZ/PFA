# Interface Control Document (ICD)

This folder contains interface definitions for all modules in the LKA system.

## Module Interfaces

### Perception Module Interface

**Inputs:**
- `camera_image` (uint8 array): Raw camera image
- `vehicle_speed` (double, m/s): Current vehicle speed
- `timestamp` (double, s): Image timestamp

**Outputs:**
- `lateral_deviation` (double, m): Lateral deviation from lane center
- `lane_curvature` (double, 1/m): Road curvature
- `lane_width` (double, m): Detected lane width
- `detection_confidence` (double, 0-1): Confidence score
- `lane_detected` (boolean): Lane detection status

### Control Module Interface

**Inputs:**
- `lateral_deviation` (double, m): From perception module
- `lane_curvature` (double, 1/m): From perception module
- `vehicle_speed` (double, m/s): Current vehicle speed
- `yaw_rate` (double, rad/s): Vehicle yaw rate
- `system_state` (enum): Current system state

**Outputs:**
- `steering_command` (double, Nm): Commanded steering torque
- `steering_angle` (double, rad): Commanded steering angle
- `control_status` (enum): Control module status

### Safety Monitor Interface

**Inputs:**
- `steering_command` (double, Nm): From control module
- `driver_torque` (double, Nm): Driver steering input
- `detection_confidence` (double, 0-1): From perception
- `vehicle_speed` (double, m/s): Current speed
- `system_state` (enum): Current state

**Outputs:**
- `safety_status` (enum): Safety monitor status
- `fault_detected` (boolean): Fault flag
- `override_request` (boolean): Driver override detected
- `fail_safe_request` (boolean): Fail-safe activation request

### State Machine Interface

**Inputs:**
- `activation_request` (boolean): Driver activation request
- `safety_status` (enum): From safety monitor
- `od_conditions_met` (boolean): ODD conditions check
- `fault_detected` (boolean): From safety monitor
- `override_request` (boolean): From safety monitor

**Outputs:**
- `system_state` (enum): Current system state
- `state_transition` (enum): State transition event
- `warning_message` (string): Warning/status message

### Actuation Module Interface

**Inputs:**
- `steering_command` (double, Nm): From control module
- `system_state` (enum): Current system state
- `safety_override` (boolean): Safety override flag

**Outputs:**
- `final_steering_torque` (double, Nm): Final output to vehicle
- `actuation_status` (enum): Actuation module status

---

## Data Types

### Enumerations

**SystemState:**
- `OFF`: System inactive
- `STANDBY`: System ready but not active
- `ACTIVE`: System actively controlling
- `WARNING`: Warning state (approaching limits)
- `FAIL`: Fail-safe state

**SafetyStatus:**
- `OK`: All checks passed
- `WARNING`: Warning condition detected
- `FAULT`: Fault detected
- `OVERRIDE`: Driver override active

---

## Signal Units

| Signal | Unit | Range |
|--------|------|-------|
| Lateral Deviation | m | -2.0 to +2.0 |
| Lane Curvature | 1/m | -0.01 to +0.01 |
| Vehicle Speed | m/s | 0 to 50 |
| Steering Torque | Nm | -10 to +10 |
| Steering Angle | rad | -0.5 to +0.5 |
| Yaw Rate | rad/s | -1.0 to +1.0 |
| Detection Confidence | - | 0.0 to 1.0 |

---

**Status**: 🟡 In Progress  
**Last Updated**: November 2025

