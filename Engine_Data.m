%Importing and Initializing
data = load('Group2.mat')
thrust = deal(data.caldata)
thrust = thrust';
tstep = 1/2000; %2000 Hz data collection rate
t=0;
tb=2.3;
g=9.81;
m_prop = .121;%kg
for index = 1:1:length(thrust)-1
    t(index+1) =t(index) + tstep;
end
%total thrust curve
figure(1)
plot(t,thrust)
xlabel('Time (s)')
ylabel('Thrust (lbs)')

t_firing=t(2715:1:(2715+(tb/(1/2000))));
thrust_firing=thrust(2715:1:(2715+(tb/(1/2000))));
%Firing Thrust Curve
figure(2)
plot(t_firing, thrust_firing)
xlabel('Time (s)')
ylabel('Thrust (lbs)')

%raw data Total Impulse and Thrust
Total_Impulse = sum(thrust_firing.*1/2000)
thrust_firing_N = thrust_firing * 4.44822162;

%averaging background noise measured to subtract from measurement
noise = mean(thrust(4/tstep:1:8/tstep))

adjusted_thrust_firing= thrust_firing-noise;
Adjusted_Total_Impulse = sum(adjusted_thrust_firing.*1/2000)

%Adjusted Thrust and Total Impulse in SI units
Adjusted_thrust_firing_N = adjusted_thrust_firing * 4.44822162;
Total_Impulse_Ns = sum(Adjusted_thrust_firing_N .* tstep)

%Engine ISP and mdot per time step of firing
ISP = Total_Impulse_Ns/(m_prop*9.81)
mdot = Adjusted_thrust_firing_N./(g*ISP);

