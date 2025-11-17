%% LKA System Parameters
% This script defines all system parameters for the LKA project
% Run this script to load parameters into the workspace

%% Vehicle Parameters
vehicle.mass = 1500;              % Vehicle mass [kg]
vehicle.wheelbase = 2.7;           % Wheelbase [m]
vehicle.Cf = 80000;                % Front cornering stiffness [N/rad]
vehicle.Cr = 80000;                % Rear cornering stiffness [N/rad]
vehicle.Iz = 3000;                 % Yaw moment of inertia [kg*m^2]

%% Speed Limits
speed.v_min = 60/3.6;              % Minimum speed [m/s] (60 km/h)
speed.v_max = 130/3.6;             % Maximum speed [m/s] (130 km/h)
speed.v_min_hyst = 55/3.6;         % Minimum speed with hysteresis [m/s]
speed.v_max_hyst = 135/3.6;        % Maximum speed with hysteresis [m/s]

%% Lane Detection Parameters
lane_detection.confidence_threshold = 0.70;    % Minimum confidence for detection
lane_detection.lost_timeout = 2.0;             % Time before deactivation [s]
lane_detection.update_rate = 20;               % Update rate [Hz]
lane_detection.lane_width_nominal = 3.5;       % Nominal lane width [m]

%% Control Parameters (PID)
control_pid.Kp = 1.5;              % Proportional gain
control_pid.Ki = 0.1;              % Integral gain
control_pid.Kd = 0.5;              % Derivative gain
control_pid.max_torque = 5.0;      % Maximum steering torque [Nm]
control_pid.max_rate = 30*pi/180;  % Maximum steering rate [rad/s] (30 deg/s)

%% Control Parameters (MPC)
control_mpc.prediction_horizon = 10;           % Prediction horizon [steps]
control_mpc.control_horizon = 5;               % Control horizon [steps]
control_mpc.sample_time = 0.05;                 % Sample time [s] (20 Hz)
control_mpc.max_torque = 5.0;                  % Maximum steering torque [Nm]
control_mpc.max_rate = 30*pi/180;              % Maximum steering rate [rad/s]

% MPC weights
control_mpc.Q_lateral = 100;       % Lateral error weight
control_mpc.Q_yaw = 10;            % Yaw angle weight
control_mpc.R_torque = 1;          % Control effort weight
control_mpc.R_rate = 0.1;          % Control rate weight

%% Safety Parameters
safety.max_steering_torque = 5.0;              % Maximum allowed torque [Nm]
safety.safety_threshold = 5.5;                 % Safety threshold [Nm]
safety.safety_timeout = 0.1;                   % Safety timeout [s] (100ms)
safety.driver_override_threshold = 3.0;         % Driver override threshold [Nm]
safety.override_response_time = 0.05;          % Override response time [s] (50ms)
safety.monitor_rate = 50;                      % Safety monitor rate [Hz]

%% Road Geometry Parameters
road.min_curve_radius = 200;                   % Minimum curve radius [m]
road.max_lateral_error = 0.3;                  % Maximum lateral error [m]
road.lateral_error_target = 0.0;               % Target lateral error [m]

%% Performance Requirements
performance.lateral_error_max = 0.3;           % Maximum lateral error [m]
performance.lateral_error_rms_target = 0.1;    % Target RMS lateral error [m]
performance.latency_max = 0.1;                 % Maximum latency [s] (100ms)
performance.update_rate_min = 20;              % Minimum update rate [Hz]
performance.reliability_target = 0.95;         % Target reliability (95%)

%% System States
% State enumeration (for Stateflow)
% OFF = 0
% STANDBY = 1
% ACTIVE = 2
% WARNING = 3
% FAIL = 4

%% Display parameters
fprintf('LKA System Parameters Loaded\n');
fprintf('============================\n');
fprintf('Vehicle Mass: %.0f kg\n', vehicle.mass);
fprintf('Speed Range: %.0f - %.0f km/h\n', speed.v_min*3.6, speed.v_max*3.6);
fprintf('Lane Detection Confidence Threshold: %.2f\n', lane_detection.confidence_threshold);
fprintf('Max Steering Torque: %.1f Nm\n', control_pid.max_torque);
fprintf('Min Curve Radius: %.0f m\n', road.min_curve_radius);
fprintf('============================\n');

