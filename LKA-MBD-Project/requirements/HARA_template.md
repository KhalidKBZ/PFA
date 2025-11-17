# Hazard Analysis and Risk Assessment (HARA) Template

Following ISO 26262 methodology for hazard identification and ASIL determination.

---

## HARA Table

| Hazard ID | Hazard Description | Potential Accident | Severity | Exposure | Controllability | ASIL |
|-----------|-------------------|-------------------|----------|----------|-----------------|------|
| H-001 | Unintended steering command (LKA steers away from lane center) | Vehicle departs lane, potential collision | S3 | E4 | C2 | ASIL C |
| H-002 | LKA fails to deactivate when driver intervenes | Driver fights system, loss of control | S3 | E3 | C3 | ASIL B |
| H-003 | LKA activates in inappropriate conditions (no lane markings) | Vehicle steers based on false data | S3 | E3 | C2 | ASIL C |
| H-004 | Delayed deactivation when leaving operational domain | System attempts control beyond capabilities | S2 | E4 | C2 | ASIL B |
| H-005 | False lane detection (construction, worn markings) | Vehicle follows incorrect path | S3 | E2 | C2 | ASIL B |

---

## Severity Scale (S)

| Level | Description | Definition |
|-------|-------------|------------|
| S0 | No injuries | No injuries |
| S1 | Light injuries | Light and moderate injuries |
| S2 | Severe injuries | Severe and life-threatening injuries (survival probable) |
| S3 | Life-threatening/fatal | Life-threatening injuries (survival uncertain), fatal injuries |

---

## Exposure Scale (E)

| Level | Description | Definition |
|-------|-------------|------------|
| E1 | Very low probability | Exposure time <1% of operating time |
| E2 | Low probability | Exposure time 1-10% of operating time |
| E3 | Medium probability | Exposure time 10-50% of operating time |
| E4 | High probability | Exposure time >50% of operating time |

---

## Controllability Scale (C)

| Level | Description | Definition |
|-------|-------------|------------|
| C0 | Controllable in general | Controllable by an average driver in general |
| C1 | Simply controllable | Controllable by an average driver with simple corrective action |
| C2 | Normally controllable | Controllable by an average driver with normal corrective action |
| C3 | Difficult to control | Controllable by an average driver with difficult corrective action |

---

## ASIL Determination Table

| Severity | Exposure | Controllability | ASIL |
|----------|----------|-----------------|------|
| S3 | E4 | C1 | ASIL D |
| S3 | E4 | C2 | ASIL C |
| S3 | E4 | C3 | ASIL B |
| S3 | E3 | C1 | ASIL C |
| S3 | E3 | C2 | ASIL C |
| S3 | E3 | C3 | ASIL B |
| S3 | E2 | C1 | ASIL B |
| S3 | E2 | C2 | ASIL B |
| S3 | E2 | C3 | ASIL A |
| S2 | E4 | C1 | ASIL C |
| S2 | E4 | C2 | ASIL B |
| S2 | E4 | C3 | ASIL A |
| S2 | E3 | C1 | ASIL B |
| S2 | E3 | C2 | ASIL B |
| S2 | E3 | C3 | ASIL A |
| S2 | E2 | C1 | ASIL A |
| S2 | E2 | C2 | ASIL A |
| S2 | E2 | C3 | QM |

---

## Safety Goals

For each hazard, a safety goal is defined:

### Safety Goal SG-001 (for H-001)
**Goal**: Prevent unintended steering commands that could cause lane departure  
**ASIL**: ASIL C

### Safety Goal SG-002 (for H-002)
**Goal**: Ensure immediate driver override capability  
**ASIL**: ASIL B

### Safety Goal SG-003 (for H-003)
**Goal**: Prevent activation in inappropriate conditions  
**ASIL**: ASIL C

### Safety Goal SG-004 (for H-004)
**Goal**: Ensure timely deactivation when leaving operational domain  
**ASIL**: ASIL B

### Safety Goal SG-005 (for H-005)
**Goal**: Detect and handle false lane detection  
**ASIL**: ASIL B

---

## Technical Safety Requirements (TSR)

### For Safety Goal SG-001:

**TSR-001**: The LKA controller output SHALL be limited to ±5 Nm maximum torque  
**TSR-002**: Commanded steering torque SHALL be continuously monitored by independent safety monitor  
**TSR-003**: If commanded torque exceeds safety threshold (5.5 Nm) for >100ms, system SHALL deactivate and enter fail-safe state  
**TSR-004**: Lane detection confidence SHALL be monitored; if <70% for >1 second, system SHALL deactivate

### For Safety Goal SG-002:

**TSR-005**: Driver steering torque SHALL be monitored at ≥50Hz  
**TSR-006**: If driver torque >3 Nm, LKA SHALL deactivate within 50ms  
**TSR-007**: Driver override SHALL take precedence over all LKA commands without arbitration delay

### For Safety Goal SG-003:

**TSR-008**: System SHALL verify lane marking quality before activation  
**TSR-009**: System SHALL maintain confidence threshold of ≥70% for lane detection  
**TSR-010**: System SHALL deactivate if lane markings are lost for >2 seconds

### For Safety Goal SG-004:

**TSR-011**: System SHALL monitor vehicle speed continuously  
**TSR-012**: System SHALL deactivate when speed <55 km/h or >135 km/h  
**TSR-013**: System SHALL provide warning 5 seconds before operational limit

### For Safety Goal SG-005:

**TSR-014**: System SHALL validate lane detection against vehicle dynamics  
**TSR-015**: System SHALL reject lane detections that conflict with expected road geometry  
**TSR-016**: System SHALL deactivate if lane detection confidence drops below threshold

---

## Operational Design Domain (ODD)

### Where LKA Works:
- ✅ Highway and well-maintained roads
- ✅ Clear, visible lane markings (white/yellow)
- ✅ Daylight or well-lit conditions
- ✅ Straight roads and gentle curves (R>200m)
- ✅ Speed range: 60-130 km/h
- ✅ Dry road conditions

### Where LKA Does NOT Work:
- ❌ Urban streets with frequent intersections
- ❌ Construction zones
- ❌ Severe weather (heavy rain, snow, fog)
- ❌ Sharp curves
- ❌ Unpaved roads
- ❌ Speeds <60 or >130 km/h

---

**Document Version**: 1.0  
**Last Updated**: November 2025  
**Standard**: ISO 26262-inspired approach

