%% LKA-MBD-Project Setup Script
% This script sets up the MATLAB environment for the LKA project
% Run this script once at the beginning of the project

%% Clear workspace
clear; clc; close all;

%% Add project paths
fprintf('Setting up LKA-MBD-Project paths...\n');

% Get current directory
project_root = fileparts(mfilename('fullpath'));
if isempty(project_root)
    project_root = pwd;
end

% Add paths
addpath(genpath(fullfile(project_root, 'models')));
addpath(genpath(fullfile(project_root, 'scripts')));
addpath(genpath(fullfile(project_root, 'tests')));

fprintf('Project paths added.\n');

%% Check required toolboxes
fprintf('\nChecking required toolboxes...\n');

required_toolboxes = {
    'Simulink', ...
    'Automated_Driving_Toolbox', ...
    'Vehicle_Dynamics_Blockset', ...
    'Simulink_Test', ...
    'Simulink_Coder', ...
    'Model_Predictive_Control_Toolbox', ...
    'Computer_Vision_Toolbox', ...
    'Stateflow'
};

optional_toolboxes = {
    'Simulink_Coverage', ...
    'Simulink_Requirements'
};

% Check required toolboxes
missing_required = {};
for i = 1:length(required_toolboxes)
    toolbox_name = required_toolboxes{i};
    if license('test', toolbox_name)
        fprintf('  ✓ %s - Available\n', toolbox_name);
    else
        fprintf('  ✗ %s - MISSING\n', toolbox_name);
        missing_required{end+1} = toolbox_name;
    end
end

% Check optional toolboxes
fprintf('\nChecking optional toolboxes...\n');
for i = 1:length(optional_toolboxes)
    toolbox_name = optional_toolboxes{i};
    if license('test', toolbox_name)
        fprintf('  ✓ %s - Available\n', toolbox_name);
    else
        fprintf('  ○ %s - Not available (optional)\n', toolbox_name);
    end
end

%% Display results
fprintf('\n');
if isempty(missing_required)
    fprintf('✓ All required toolboxes are available!\n');
else
    fprintf('⚠ WARNING: Missing required toolboxes:\n');
    for i = 1:length(missing_required)
        fprintf('  - %s\n', missing_required{i});
    end
    fprintf('\nPlease install missing toolboxes before proceeding.\n');
end

%% Set Simulink preferences
fprintf('\nConfiguring Simulink preferences...\n');
% Set solver
set_param(0, 'DefaultSolver', 'ode4');
set_param(0, 'DefaultSolverType', 'Fixed-step');
set_param(0, 'DefaultFixedStepSize', '0.01'); % 100 Hz

fprintf('  ✓ Solver: ode4 (Fixed-step, 0.01s)\n');

%% Create results directories if they don't exist
fprintf('\nCreating results directories...\n');
results_dir = fullfile(project_root, 'results');
if ~exist(results_dir, 'dir')
    mkdir(results_dir);
end
if ~exist(fullfile(results_dir, 'figures'), 'dir')
    mkdir(fullfile(results_dir, 'figures'));
end
if ~exist(fullfile(results_dir, 'videos'), 'dir')
    mkdir(fullfile(results_dir, 'videos'));
end
fprintf('  ✓ Results directories created\n');

%% Display project information
fprintf('\n');
fprintf('========================================\n');
fprintf('LKA-MBD-Project Setup Complete\n');
fprintf('========================================\n');
fprintf('Project Root: %s\n', project_root);
fprintf('MATLAB Version: %s\n', version);
fprintf('Simulink Version: %s\n', get_param(0, 'Version'));
fprintf('========================================\n');
fprintf('\nNext steps:\n');
fprintf('1. Review requirements in requirements/ folder\n');
fprintf('2. Start with Phase 1: Requirements & Safety Engineering\n');
fprintf('3. Begin system architecture design\n');
fprintf('\n');

%% Save project root to workspace
assignin('base', 'LKA_ProjectRoot', project_root);
fprintf('Project root saved to workspace variable: LKA_ProjectRoot\n');

