clear;clc;close all;

% Create a random environment
env = Environment;

% Create a Q-LearningAgent
agent = QLearningAgent;

%% Perform Q-Learning
nIterations = 500;

% Set up variables for analysis
arrayForm = zeros(length(agent.QMatrix(:)),nIterations);
stateArray = zeros(1,nIterations);


for i = 1:nIterations
   %Choose action based on the current state, Q-table, random exploration
   currentState = env.currentState();
   action = agent.chooseAction(currentState);
   
   [env, nextState, reward] = env.interfaceWithEnvironment(action);
   
   agent = agent.updateQMatrix(currentState,action,reward,nextState);
   
   % Record Statistics
   arrayForm(:,i) = agent.QMatrix(:);
   stateArray(i) = nextState;
end

%Figures
figure
plot(arrayForm');
figure
plot(stateArray);