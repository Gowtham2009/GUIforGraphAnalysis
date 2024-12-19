

% 14 january changes
% Muzzle velocity is corrected

i =  input('Give Title for the plots :','s');
a1=  input('Enter the time duration of trial :');


dir=input('Give the directory where data files are present __Enter c for default directory E:- EHWT :','s');

disp('DIRECTORY IS ');

disp(dir);
k=0; prev=0;col=1;
firstxy=0;
firstx=0;
firstm=0;
firsti=0;
firsta=0;
firstc=0;
firsth=0;
firsth1=0;

firsth2=0;
firstha=0;
firstfm4=0;
firstfm5a=0;
firstfm5b=0;
range_dec=0;
firstMF=0;
q = 0 ;
axsed=0;
j=0;
x=0;
y=0;
range1= 0;
j10=1;
j11=0;
j12=0;
j13=0;
multiplotsrt = 0;
total=113;
color=char('b','k','r','m','c','g','y');

yax=char('1 XY Plot','2 ALARMS','3 DEPTH INST(meters)','4 Ballon Pressure','5 EB(V)','6 SDEPTH(meters)', '7 yaw(degrees)','8 Deep Depth(meters)','9 ROLL(degrees)','10 PITCH(degrees)','11 ROLLRATE','12 YAW Rate','13 Pitch Rate','14 PORT CMD','15 STBD CMD','16 TOP CMD','17 BOTCMD','18 Essen_wake','19 Spare','20 MCCSSTS','21 MCCSSTS1','22 MCCSRPM','23 Horizbearing', '24 verbearing','25 target range','26 BC-RT(ACE,SDO)','27 BatteryVoltage(V)','28 BatteryCurrent(A)','29 motor1speed(RPM)','30 motor2speed(RPM)','31 motor1voltage','32 motor2voltage','33 motor1current(A)','34 motor2current(A)','35 motor1index','36 motor2index','37 motor1temp','38 motor2temp','39 faultindic','40 commandwordecho','41 ReferenceSpdecho','42 FOC HALT CMD','43 commandwordmccs','44 motorsetspeedccs','45 mccsflags','46 wakehomingflags','47 m1currentm2current','48 Enable sts','49 DCACt VTG','50 STBDPOS_CMD1','51 Current_FB1','52 RPM_FB1','53 STBDPOS_FB1','54 YAWBOTPOS_CMD2','55 Current_FB2','56 RPM_FB2','57 YAWBOTPOS_FB2','58 YAWTOPPOS_CMD3','59 Current_FB3','60 RPM_FB3','61 YAWTOPPOS_FB3','62 PORTPOS_CMD4','63 CURRENT_FB4','64 RPM_FB4','65 PORT POS_FB4','66 ACTFaultInd1','67 ACTFaultInd2','68 spare','69 BatVoltageCurrent','70 M1SpeedM2Speed','71 acceleration(x)','72 acceleration(y)','73 acceleration(z)','74 spare','75 northvelocity(m/s)','76 eastvelocity(m/s)','77 Muzzle velocity(m/s)','78 downvelocity(m/s)','79 Bitsts','80 Recovery Status','81 power(Watt)','82 HSM FLAG1','83 HBearing(deg)','84 HSM FLAG2','85 VBearing(deg)','86 Range(m)','87 HSMSearchAngle','88 APFRANGE','89 HSMNoise','90 RLGMsgErr','91 MotorMsgErr','92 TD_plots','93 RINS ROLL','94 RINS PITCH','95 RINS YAW','96 RINS RATE_X','97 RINS RATE_Y','98 RINS RATE_Z','99 RINS ACC_X','100 RINS ACC_Y','101 RINS ACC_Z','preset_parms_rcvdtime','alignmenttime','externalpowertime','homingcontrlontime','iprscommurelayofftime','actuationendtime','powerdisttimeovertime','mCCShealthsettime','gpsparamsrecordtime','gpsparamsset2rlgtime','MCCS Homing flags','BAT_28V');
while (k<total+5)
    k =menu('EHWT1 :TRIAL:', 'XY Plot','ALARMS','DEPTH INST(meters)','Ballon Pressure','EB(V)','SDEPTH(meters)', 'yaw(degrees)','Deep Depth(meters)','ROLL(degree)','PITCH(degree)','ROLLRATE','YAW Rate','Pitch Rate','PORT CMD','STBD CMD','TOP CMD','BOTCMD','Essen_wake','Spare','MCCSSTS','MCCSSTS1','MCCSRPM','Horizbearing', 'verbearing','target range','BC-RT(ACE,SDO)','BatteryVoltage(V)','BatteryCurrent(A)','motor1speed(RPM)','motor2speed(RPM)','motor1voltage','motor2voltage','motor1current(A)','motor2current(A)','motor1index','motor2index','motor1temp','motor2temp','faultindic','commandwordecho','ReferenceSpdecho','FOC HALT CMD','commandwordmccs','motorsetspeedmccs','mccsflags','wakehomingflags','m1currentm2current','Enable sts','DCACt VTG','STBDPOS_CMD1','Current_FB1','RPM_FB1','STBDPOS_FB1','YAWBOTPOS_CMD2','Current_FB2','RPM_FB2','YAWBOTPOS_FB2','YAWTOPPOS_CMD3','Current_FB3','RPM_FB3','YAWTOPPOS_FB3','PORT POS_CMD4','CURRENT_FB4','RPM_FB4','PORT POS_FB4','ACTFaultInd1','ACTFaultInd2','spare','MtVoltageMtCurrent','m1speedm2speed','acceleration(x)','acceleration(y)','acceleration(z)','spare','northvelocity(m/s)','eastvelocity(m/s)','Muzzle velocity(m/s)','downvelocity','Bitsts','Recovery Status','power(Watt)','HSM FLAG1','HBearing','HSM FLAG2','VBearing','Range','HSMSearchAngle','APF RANGE','HSM NOISE','RLGMsgErr','MotorMsgErr','TD_plots','RINS ROLL',' RINS PITCH','RINS YAW','RINS RATE_X','RINS RATE_Y','RINS RATE_Z','RINS ACC_X','RINS ACC_Y','RINS ACC_Z','preset_parms_rcvdtime','alignmenttime','externalpowertime','homingcontrlontime','iprscommurelayofftime','actuationendtime','powerdisttimeovertime','mCCShealthsettime','gpsparamsrecordtime','gpsparamsset2rlgtime','MCCS_Homing_flags','BAT_28V','Print All','MULTI PLOTS','END MULTI','END');
    
    if (k < total+1)
        start_par=k
        end_par=k
        p=k
    else
        start_par=1
        end_par=k-1      %  Till here plot
    end
    
    % multiplot start
    if (k==total+2)
        prev=1;
        multiplotsrt = 1;
    end
    
    %---- Multiplot end
    if  (k==total+3)
        prev=0;
        multiplotsrt = 0;
        legend off;
        hold off;
    end
    
    %     if(prev==0)
    %         hold off
    %         col=1;
    %     end
    
    %end of program
    if(k==total+4)                 %79 to 80
        clear;
        close(menu)
    end
    
    if (k < total+2)  % plotting all the plots
        if (k < total+1)
            start_par=k;
            end_par=k;
            p=k;
        else
            start_par=1;
            end_par=k-1;      % Till here plot
        end
        
        for p=start_par:end_par
            
            if (prev==0)
                hold off;
                col=1;
            end
            
            switch p
                %xy-plot
                case 1
                    name1=cat(2,dir,'xy.DAT');
                    load(name1);                   
                   axsed=1;                   
                    plot(xy(:,7),xy(:,6)*(1),color(col));
%                      plot(xy(:,6),xy(:,5)*(1),color(col));
%                     plot(xy(:,6),xy(:,7)*(1),color(col));
%                     set(gca,'ydir','reverse');
                 ylabel(yax(p, :));            
                    hold on;
                   nam='marker.dat';
                    name1=cat(2,dir,nam);
                    load(name1);
                    plot((marker (:,1)),(marker (:,2)),'+')
                    q = length(marker);
                    xd = (marker (:,1));
                    yd = (marker (:,2));
                    
                    
                    for j=1:1:q
                        x= xd(j);
                        y= yd(j);
                        %q = sprintf('%d',j*10);
                        q = sprintf('%3.0f',marker (j,3));
                        text(x,y,q,'color','red','FontSize',8);
                    end
                    % xlim([-10,3000])
%                     ylim([-10,3000])
                    grid on
                    zoom on
                    axis equal;
                    
                case 2       %ALARMS
                    if (firsta==0)
                        firsta=1;
                        name1=cat(2,dir,'ALARMS.DAT');
                        load (name1);
                    else
                    end
                    plot(ALARMS(:,1),ALARMS(:,2),ALARMS(:,1), ALARMS(:,3),ALARMS(:,1),ALARMS(:,4),ALARMS(:,1),ALARMS(:,5),ALARMS(:,1),ALARMS(:,6),ALARMS(:,1),ALARMS(:,7),ALARMS(:,1),ALARMS(:,8),ALARMS(:,1),ALARMS(:,9))
                    
                    xlim([-4000,a1]);
                    ylim([0,18]);
                    set(gca,'YTick',[2 4 6 8 10 12 14 16]);
                    set(gca,'YTickLabel',{'RUNSTART';'MB';'28V LOW';'DCO';'CCO';'LCS';'IDAS RT';'MCCS RT'})
                    grid on
                    zoom on
                    
                    ylabel(yax(p, :));
                    
                case 3
                    % Depth
                    if (firsti==0)
                        firsti=1;
                        name1=cat(2,dir,'INST.DAT');
                        load(name1);
                    else
                    end
                    plot(INST(:,1),INST(:,2)*(1),color(col)) ;
                    ylabel(yax(p, :));
                    ylim([-300,10]);
                    legend('color');
                    grid on
                    zoom on
               case 4
                    % Balloon pressure
                    if (firsti==0)
                        firsti=1;
                        name1=cat(2,dir,'INST.DAT');
                        load(name1);
                    else
                    end
                    %plot(INST(:,1),INST(:,19)*(1),color(col)) ;
                     plot(INST(:,1),INST(:,4)*(1),color(col)) ;
                    ylabel(yax(p, :));
                    ylim([-300,10]);
                   % ylim([0,400]);
                    legend('color');
                    grid on
                    zoom on    
                    
                    
                    
                    
%              %   case 4
%                     % LCS Analog
%                     if (firsti==0)
%                         firsti=1;
%                         name1=cat(2,dir,'INST.DAT');
%                         load(name1)
%                     else
%                     end
%                     plot(INST(:,1),INST(:,3)*(1),color(col))
%                     ylabel(yax(p, :));
%                     ylim([-1,6])
%                     grid on
%                     zoom on
                    
                case 5
                    % EB 28V
                    if (firsti==0)
                        firsti=1;
                        name1=cat(2,dir,'INST.DAT');
                        load(name1);
                    else
                    end
                    plot(INST(:,1),INST(:,5)*(1),color(col));
                    % Control data
                    ylabel(yax(p, :));
                    ylim([-10,36])
                    grid on;
                    zoom on;
                    %ylabel(yax(p, :));
                    
                case 6
                    %Shallow depth
                    if (firstc==0)
                        firstc=1;
                        name1=cat(2,dir,'control.DAT');
                        load(name1);
                    else
                    end
                    plot(control(:,1),control(:,2)*(1),color(col));
                    
                    ylabel(yax(p, :));
                    ylim([-50,10])
                    grid on;
                    zoom on;
                    
                case 7
                    % YAW
                    if (firstc==0)
                        firstc=1;
                        name1=cat(2,dir,'control.DAT');
                        load(name1);
                    else
                    end
                    plot(control(:,1),control(:,6)*(1),color(col));
                    ylabel(yax(p, :));
                    ylim([-190,190]);
                    grid on;
                    zoom on;
                    
                    
                case 8
                    % Deep Depth
                    if (firstc==0)
                        firstc=1;
                        name1=cat(2,dir,'control.DAT');
                        load(name1);
                    else
                    end
                    plot(control(:,1),control(:,7)*(1),color(col));
                    grid on;
                    zoom on;
                    ylabel(yax(p, :));
                    ylim([-700,10]);
                    grid on;
                    zoom on;
                    
                case 9
                    % Roll
                    if (firstc==0)
                        firstc=1;
                        name1=cat(2,dir,'control.DAT');
                        load(name1);
                    else
                    end
                    
                    plot(control(:,1),control(:,8)*(1),color(col));
                    ylabel(yax(p, :));
                    ylim([-100,100]);
                    grid on;
                    zoom on;
                case 10
                    %  PITCH
                    if (firstc==0)
                        firstc=1;
                        name1=cat(2,dir,'control.DAT');
                        load(name1);
                    else
                    end
                    plot(control(:,1),control(:,9)*(1),color(col));
                    ylabel(yax(p, :));
                    ylim([-100,100]);
                    grid on;
                    zoom on;
                case 11
                    % RollRate
                    if (firstc==0)
                        firstc=1;
                        name1=cat(2,dir,'control.DAT');
                        load(name1)
                    else
                    end
                    plot(control(:,1),control(:,10)*(1),color(col));
                    ylabel(yax(p, :));
                    ylim([-20,20]);
                    grid on
                    zoom on
                    
                case 12
                    % YAW Rate
                    if (firstc==0)
                        firstc=1;
                        name1=cat(2,dir,'control.DAT');
                        load(name1);
                    else
                    end
                    plot(control(:,1),control(:,11)*(1),color(col));
                    ylabel(yax(p, :));
                    ylim([-20,20]);
                    grid on
                    zoom on
                    
                case 13
                    % Pitch Rate
                    if (firstc==0)
                        firstc=1;
                        name1=cat(2,dir,'control.DAT');
                        load(name1)
                    else
                    end
                    plot(control(:,1),control(:,12)*(1),color(col));
                    ylabel(yax(p, :));
                    ylim([-20,20]);
                    grid on
                    zoom on
                    
                case 14
                    %PRTCMD
                    if (firstc==0)
                        firstc=1;
                        name1=cat(2,dir,'control.DAT');
                        load(name1);
                    else
                    end
                    plot(control(:,1),control(:,15)*(1),color(col)) ;
                    ylabel(yax(p, :));
                    ylim([-22,22]);
                    grid on
                    zoom on
                case 15
                    %STBD CMD
                    if (firstc==0)
                        firstc=1;
                        name1=cat(2,dir,'control.DAT');
                        load(name1);
                    else
                    end
                    plot(control(:,1),control(:,16)*(1),color(col));
                    ylabel(yax(p, :));
                    ylim([-22,22]);
                    grid on
                    zoom on
                case 16
                    % TOP CMD
                    if (firstc==0)
                        firstc=1;
                        name1=cat(2,dir,'control.DAT');
                        load(name1);
                    else
                    end
                    plot(control(:,1),control(:,17)*(1),color(col));
                    ylabel(yax(p, :));
                    ylim([-22,22]);
                    grid on
                    zoom on
                    
                case 17
                    %BOT CMD
                    if (firstc==0)
                        firstc=1;
                        name1=cat(2,dir,'control.DAT');
                        load(name1);
                    else
                    end
                    plot(control(:,1),control(:,18)*(1),color(col)) ;
                    ylabel(yax(p, :));
                    ylim([-22,22]);
                    grid on
                    zoom on
                    
                case 18
                    %Water Contact Flag//ESSEN WAKE 
                    if (firstc==0)
                        firstc=1;
                        name1=cat(2,dir,'control.DAT');
                        load(name1)
                    else
                    end
%                     plot(control(:,1),control(:,19)*(1),color(col)) ;
 plot(control(:,1),control(:,27)*(1),color(col)) ;
set(gca,'YTick',[22]);
% %                     xlim([-10,a1])
                    ylim([20,25]);
                    set(gca,'YTickLabel',{'Wake detection Essen'})
                  
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                    
                case 19
                    %acx  // spare// Xy distance plot
                   if (firstc==0)
                        firstc=1;
                          name1=cat(2,dir,'MCS_Data.DAT');
                        load(name1)
                    else
                   end           
                    plot(MCS_Data(:,4),MCS_Data(:,28)*(1),color(col));
                    ylabel(yax(p, :));
%                     xlim([-10,a1]);
%                     ylim([0,al]);
axesed=1;
                    grid on;
                    zoom on;
                    
                case 20
                    %MCCS STS
                    if (firstc==0)
                        firstc=1;
                        name1=cat(2,dir,'MCCSFlags.DAT');
                        load(name1)
                    else
                    end
                    plot(MCCSFlags(:,1),MCCSFlags(:,2),MCCSFlags(:,1), MCCSFlags(:,3),MCCSFlags(:,1),MCCSFlags(:,4),MCCSFlags(:,1),MCCSFlags(:,5),MCCSFlags(:,1),MCCSFlags(:,6),MCCSFlags(:,1),MCCSFlags(:,7),MCCSFlags(:,1),MCCSFlags(:,8),MCCSFlags(:,1),MCCSFlags(:,9),MCCSFlags(:,1),MCCSFlags(:,10))
                    
                    xlim([-10,a1]);
                    ylim([0,17]);
                    set(gca,'YTickLabel',{'Contactor ON W19/M13';'T1 off';'T2 off';'U vol flag';'O current flag';'Motor align Over';'Motor Align T out';'Wire Guid Intact';'RT From ASH'})
                     ylabel(yax(p, :));
                    
                case 21
                    %MCCS STS1
%                       MCCS to HSM
                    name1=cat(2,dir,'MCCSFlags.DAT');
                    load (name1)                    
                    plot(MCCSFlags(:,1),MCCSFlags(:,31),MCCSFlags(:,1), MCCSFlags(:,32),MCCSFlags(:,1),MCCSFlags(:,33),MCCSFlags(:,1),MCCSFlags(:,34),MCCSFlags(:,1),MCCSFlags(:,35),MCCSFlags(:,1),MCCSFlags(:,36),MCCSFlags(:,1),MCCSFlags(:,37),MCCSFlags(:,1),MCCSFlags(:,38));
                    set(gca,'YTick',[61 65 67 69 71 73 77 79]);
%                     xlim([-10,a1])
                    ylim([60,82]);
                    set(gca,'YTickLabel',{'Search Pattern';'Waters';'Water contact';'DPC';'steer away phase';'LFM';'Warshot';'ISR'})
                    ylabel(yax(p, :));
                    
                    
                case 22 % rpm
                    %MCCS RPM Spare
                    
                    if (firstm==0)
                        firstm=1;
                        name1=cat(2,dir,'MCS_Data.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(MCS_Data(:,1),MCS_Data(:,3)*(1),color(col))
                    ylabel(yax(p, :));
                    
                    
                    
                case 23   % Horizontal bearing
                    %
                    if (firstm==0)
                        firstm=1;
                        name1=cat(2,dir,'MCS_Data.DAT');
                        load(name1)
                    else
                    end
                    
                    
                    plot(MCS_Data(:,1),MCS_Data(:,30),color(col))
                    ylabel(yax(p, :));
                    grid on;
                    
                case 24  % Vertical bearing
                    %
                    
                    if (firstm==0)
                        firstm=1;
                        name1=cat(2,dir,'MCS_Data.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(MCS_Data(:,1),MCS_Data(:,7)*(1),color(col))
                    ylabel(yax(p, :));
                    
                case 25  % Target Range
                    %
                    
                    if (firstm==0)
                        firstm=1;
                        name1=cat(2,dir,'MCS_Data.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(MCS_Data(:,1),MCS_Data(:,31)*(1),color(col))
                    
                    ylabel(yax(p, :));
                    
                case 26  %  Spare  BC-RT ACE,SDO
%                      
                    name1=cat(2,dir,'MCCSFlags.DAT');
                    load(name1);                   
                    plot(MCCSFlags(:,1),MCCSFlags(:,21),MCCSFlags(:,1), MCCSFlags(:,20));
                    xlim([-50,a1]);
                    ylim([0,42]);
                    set(gca,'YTick',[34 38]);
                    set(gca,'YTickLabel',{'ACE';'SDO'});                                
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                    
                case 27  % Battery Voltage
                    
                    
                    if (firstm==0)
                        firstm=1;
                        name1=cat(2,dir,'MCS_Data.DAT');
                        load(name1)
                    else
                    end
                    plot(MCS_Data(:,1),MCS_Data(:,8)*(1),color(col));
                    
                    grid on
                    zoom on
                    ylabel(yax(p, :));
                    
                case 28  % Battery Current
                    %
                    
                    if (firstm==0)
                        firstm=1;
                        name1=cat(2,dir,'MCS_Data.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(MCS_Data(:,1),MCS_Data(:,9)*(1),color(col));
                    grid on
                    zoom on
                    ylabel(yax(p, :));
                    
                case 29  % Motor1 Speed
                    %
                    
                    if (firstm==0)
                        firstm=1;
                        name1=cat(2,dir,'MCS_Data.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(MCS_Data(:,1),MCS_Data(:,10)*(1),color(col));
                    
                    grid on
                    zoom on
                    ylabel(yax(p, :));
                    
                case 30 % Motor2 Speed
                    %
                    
                    if (firstm==0)
                        firstm=1;
                        name1=cat(2,dir,'MCS_Data.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(MCS_Data(:,1),MCS_Data(:,11)*(1),color(col));
                    
                    grid on
                    zoom on
                    ylabel(yax(p, :));
                case 31  % Motor1 Voltage
                    %
                    
                    if (firstm==0)
                        firstm=1;
                        name1=cat(2,dir,'MCS_Data.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(MCS_Data(:,1),MCS_Data(:,12)*(1),color(col));
                    grid on;
                    zoom on;
                    
                    ylabel(yax(p, :));
                    
                case 32 % Motor2 Voltage
                    %
                    
                    if (firstm==0)
                        firstm=1;
                        name1=cat(2,dir,'MCS_Data.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(MCS_Data(:,1),MCS_Data(:,13)*(1),color(col));
                    grid on
                    zoom on
                    ylabel(yax(p, :));
                    
                case 33  % Motor1 Current
                    %
                    
                    if (firstm==0)
                        firstm=1;
                        name1=cat(2,dir,'MCS_Data.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(MCS_Data(:,1),MCS_Data(:,14)*(1),color(col));
                    
                    grid on
                    zoom on
                    ylabel(yax(p, :));
                case 34 % Motor2 Current
                    %
                    
                    if (firstm==0)
                        firstm=1;
                        name1=cat(2,dir,'MCS_Data.DAT');
                        load(name1);
                    else
                    end
                    
                    plot(MCS_Data(:,1),MCS_Data(:,15)*(1),color(col));
                    grid on;
                    zoom on;
                    ylabel(yax(p, :));
                    
                case 35  % Motor1 Index
                    %
                    
                    if (firstm==0)
                        firstm=1;
                        name1=cat(2,dir,'MCS_Data.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(MCS_Data(:,1),MCS_Data(:,16)*(1),color(col));
                    
                    grid on;
                    zoom on;
                    ylabel(yax(p, :));
                    
                case 36 % Motor2 Index
                    %
                    
                    if (firstm==0)
                        firstm=1;
                        name1=cat(2,dir,'MCS_Data.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(MCS_Data(:,1),MCS_Data(:,17)*(1),color(col));
                    grid on
                    zoom on
                    ylabel(yax(p, :));
                    
                case 37  % Motor1 Temp
                    %
                    
                    if (firstm==0)
                        firstm=1;
                        name1=cat(2,dir,'MCS_Data.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(MCS_Data(:,1),MCS_Data(:,18)*(1),color(col));
                    grid on
                    zoom on
                    ylabel(yax(p, :));
                    
                case 38 % Motor2 Temp
                    %
                    
                    if (firstm==0)
                        firstm=1;
                        name1=cat(2,dir,'MCS_Data.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(MCS_Data(:,1),MCS_Data(:,19)*(1),color(col));
                    grid on
                    zoom on
                    ylabel(yax(p, :));
                    
                case 39  % Fault Indications
                    
                    if (firstm==0)
                        firstm=1;
                        name1=cat(2,dir,'MCS_Data.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(MCS_Data(:,1),MCS_Data(:,20)*(1),color(col));
                    grid on
                    zoom on
                    ylabel(yax(p, :));
                    
                case 40 % Command Word Echo
                    %
                    
                    if (firstm==0)
                        firstm=1;
                        name1=cat(2,dir,'MCS_Data.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(MCS_Data(:,1),MCS_Data(:,21)*(1),color(col));
                    grid on
                    zoom on
                    ylabel(yax(p, :));
                    
                case 41  % Ref Speed Echo
                    
                    if (firstm==0)
                        firstm=1;
                        name1=cat(2,dir,'MCS_Data.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(MCS_Data(:,1),MCS_Data(:,22)*(1),color(col));
                    grid on
                    zoom on
                    ylabel(yax(p, :));
                    
                case 42 % Spare
                    
%                     if (firstm==0)
%                         firstm=1;
%                         name1=cat(2,dir,'MCS_Data.DAT');
%                         load(name1)
%                     else
%                     end
%                     
%                     plot(MCS_Data(:,1),MCS_Data(:,23)*(1),color(col));
%                     grid on
%                     zoom on
%                     ylabel(yax(p, :));
                      name1=cat(2,dir,'MCCSFlags.DAT');
                    load(name1);                   
                   plot(MCCSFlags(:,1),MCCSFlags(:,22));               
                                xlim([-50,a1]);
                   ylim([0,40]);
%                     set(gca,'YTick',[1 10]);
%                     set(gca,'YTickLabel',{'FOC HALT CMD'});                                
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                case 43  % Command Word MCCS
                    %
                    
                    if (firstm==0)
                        firstm=1;
                        name1=cat(2,dir,'MCS_Data.DAT');
                        load(name1)
                    else
                    end
                    plot(MCS_Data(:,1),MCS_Data(:,24)*(1),color(col)) ;
                    grid on
                    zoom on
                    ylabel(yax(p, :));
                    
                case 44 % MOTOR SET Speed MCCS
                    
                    if (firstm==0)
                        firstm=1;
                        name1=cat(2,dir,'MCS_Data.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(MCS_Data(:,1),MCS_Data(:,25)*(1),color(col)) ;
                    grid on
                    zoom on
                    ylabel(yax(p, :));
                    
                case 45  % MCCS Flags-1
                    
                    
                    name1=cat(2,dir,'MCCSFlags.DAT');
                    load(name1)
                    
                    %plot(Horiz_bearing(:,1),Horiz_bearing(:,2)*(1),color(col))
                    
                    plot(MCCSFlags(:,1),MCCSFlags(:,2),MCCSFlags(:,1), MCCSFlags(:,3),MCCSFlags(:,1),MCCSFlags(:,4),MCCSFlags(:,1),MCCSFlags(:,5),MCCSFlags(:,1),MCCSFlags(:,6),MCCSFlags(:,1),MCCSFlags(:,7),MCCSFlags(:,1),MCCSFlags(:,8),MCCSFlags(:,1),MCCSFlags(:,9),MCCSFlags(:,1),MCCSFlags(:,10),MCCSFlags(:,1),MCCSFlags(:,13),MCCSFlags(:,1),MCCSFlags(:,14),MCCSFlags(:,1),MCCSFlags(:,15),MCCSFlags(:,1),MCCSFlags(:,16),MCCSFlags(:,1),MCCSFlags(:,17),MCCSFlags(:,1),MCCSFlags(:,18),MCCSFlags(:,1),MCCSFlags(:,19));%,MCCSFlags(:,1),MCCSFlags(:,20));
                    
                    xlim([-50,a1]);
                    ylim([-2,36]);
                    set(gca,'YTick',[0 2 4 6 8 10 12 14 16 22 24 26 28 30 32 34]);
                    set(gca,'YTickLabel',{'contactorON';'T1off';'T2off';'undervtgFlag';'overcurrent';'MOTORAlignmentOver';'MtrAlignmTimeout';'WireGuidanceIntact';'RTflag';'Cablecut';'WeightinADC';'Torpedoleftthetube';'CableCutTimeOut';'TorpedoLefttheTube';'WeighttimeoutforFOC';'InfiniteADC'})
                    grid on
                    zoom on
                    ylabel(yax(p, :));
                    
                case 46 % Wake Homing Data/Flags
                   
                    name1=cat(2,dir,'MCCSFlags.DAT');
                    load(name1);                   
                    plot(MCCSFlags(:,1),MCCSFlags(:,11),MCCSFlags(:,1), MCCSFlags(:,12));
                   
                    xlim([-50,a1]);
                    ylim([10,24]);
                    set(gca,'YTick',[18 20]);
                    set(gca,'YTickLabel',{'WakeHSMOk';'WakeContactDetected'});                                
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                    
                case 47  % Multiplot- M1 Current & M2 Current
                    %
                    
                    if (firstm==0)
                        firstm=1;
                        name1=cat(2,dir,'MCS_Data.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(MCS_Data(:,1),MCS_Data(:,14)*(1),MCS_Data(:,1),MCS_Data(:,15)*(1));
                    grid on;
                    zoom on;
                    legend('m1cur','m2cur');
                    
                case 48  % Actuation data   enable status
                    %
                    if (firstha==0)
                        firstha=1;
                        name1=cat(2,dir,'Actuation.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(Actuation(:,1),Actuation(:,2)*(1),color(col));
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                    
                case 49  % Actuation data   65V
                    
                    if (firstha==0)
                        firstha=1;
                        name1=cat(2,dir,'Actuation.DAT');
                        load(name1);
                    else
                    end
                    
                    plot(Actuation(:,1),Actuation(:,3)*(1),color(col)) ;
                    
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                case 50  % Actuation data   POS_CMD1
                    
                    if (firstha==0)
                        firstha=1;
                        name1=cat(2,dir,'Actuation.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(Actuation(:,1),Actuation(:,4)*(1),color(col));
                    
                    xlim([-10,a1])
                    %ylim([0,18])
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                    
                case 51  % Actuation data  Current FB1
                    
                    if (firstha==0)
                        firstha=1;
                        name1=cat(2,dir,'Actuation.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(Actuation(:,1),Actuation(:,5)*(1),color(col));
                    
                    
                    grid on
                    zoom on
                    
                case 52  % Actuation data   RPM FB1
                    %
                    
                    if (firstha==0)
                        firstha=1;
                        name1=cat(2,dir,'Actuation.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(Actuation(:,1),Actuation(:,6)*(1),color(col));
                    
                    
                    grid on
                    zoom on
                    
                case 53  % Actuation data   POSFB1
                    %
                    
                    if (firstha==0)
                        firstha=1;
                        name1=cat(2,dir,'Actuation.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(Actuation(:,1),Actuation(:,7)*(1),color(col));
                    xlim([-10,a1])
                    %ylim([0,18])
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                    
                    
                case 54  % Actuation data   POS CMD2
                    
                    if (firstha==0)
                        firstha=1;
                        name1=cat(2,dir,'Actuation.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(Actuation(:,1),Actuation(:,8)*(1),color(col));
                    
                    xlim([-10,a1])
                    %ylim([0,18])
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                    
                case 55  % Actuation data   Current FB2
                    %
                    
                    if (firstha==0)
                        firstha=1;
                        name1=cat(2,dir,'Actuation.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(Actuation(:,1),Actuation(:,9)*(1),color(col));
                    
                    xlim([-10,a1])
                    %ylim([0,18])
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                    
                case 56  % Actuation data   RPM_FB2
                    %
                    
                    if (firstha==0)
                        firstha=1;
                        name1=cat(2,dir,'Actuation.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(Actuation(:,1),Actuation(:,10)*(1),color(col));
                    
                    xlim([-10,a1])
                    %ylim([0,18])
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                    
                case 57  % Actuation data   POS_FB2
                    %
                    
                    if (firstha==0)
                        firstha=1;
                        name1=cat(2,dir,'Actuation.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(Actuation(:,1),Actuation(:,11)*(1),color(col)) ;
                    
                    xlim([-10,a1])
                    %ylim([0,18])
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                    
                case 58  % Actuation data   POS_CMD3
                    %
                    
                    if (firstha==0)
                        firstha=1;
                        name1=cat(2,dir,'Actuation.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(Actuation(:,1),Actuation(:,12)*(1),color(col));
                    
                    xlim([-10,a1])
                    %ylim([0,18])
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                    
                case 59  % Actuation data  current_FB3
                    %
                    
                    if (firstha==0)
                        firstha=1;
                        name1=cat(2,dir,'Actuation.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(Actuation(:,1),Actuation(:,13)*(1),color(col));
                    
                    xlim([-10,a1])
                    %ylim([0,18])
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                    
                case 60  % Actuation data   RPM_FB3/Velocity FB3
                    %
                    
                    if (firstha==0)
                        firstha=1;
                        name1=cat(2,dir,'Actuation.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(Actuation(:,1),Actuation(:,14)*(1),color(col));
                    
                    xlim([-10,a1])
                    %ylim([0,18])
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                    
                case 61  % Actuation data   POS_FB3
                    %
                    
                    if (firstha==0)
                        firstha=1;
                        name1=cat(2,dir,'Actuation.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(Actuation(:,1),Actuation(:,15)*(1),color(col));
                    
                    xlim([-10,a1])
                    %ylim([0,18])
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                    
                case 62  % Actuation data   POS_CMD4
                    %
                    
                    if (firstha==0)
                        firstha=1;
                        name1=cat(2,dir,'Actuation.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(Actuation(:,1),Actuation(:,16)*(1),color(col));
                    
                    
                    xlim([-10,a1])
                    %ylim([0,18])
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                case 63  % Actuation data   CURRENT_FB4
                    %
                    
                    if (firstha==0)
                        firstha=1;
                        name1=cat(2,dir,'Actuation.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(Actuation(:,1),Actuation(:,17)*(1),color(col));
                    
                    xlim([-10,a1])
                    %ylim([0,18])
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                    
                case 64  % Actuation data   RPM_FB4/VEL_FB4
                    %
                    
                    if (firstha==0)
                        firstha=1;
                        name1=cat(2,dir,'Actuation.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(Actuation(:,1),Actuation(:,18)*(1),color(col));
                    
                    xlim([-10,a1])
                    %ylim([0,18])
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                    
                case 65 % Actuation data   POS_FB4
                    %
                    
                    if (firstha==0)
                        firstha=1;
                        name1=cat(2,dir,'Actuation.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(Actuation(:,1),Actuation(:,19)*(1),color(col));
                    
                    xlim([-10,a1])
                    %ylim([0,18])
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                    
                case 66 % Actuation data  Spare
                    %
                    
                    if (firstha==0)
                        firstha=1;
                        name1=cat(2,dir,'Actuation.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(Actuation(:,1),Actuation(:,20)*(1),color(col));
                    xlim([-10,a1])
                    %ylim([0,18])
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                    
                case 67 % ACtuation data  Spare
                    %
                    
                    if (firstha==0)
                        firstha=1;
                        name1=cat(2,dir,'Actuation.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(Actuation(:,1),Actuation(:,21)*(1),color(col));
                    xlim([-10,a1])
                    %ylim([0,18])
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                    
                case 68 %   SPARE
                    
                    if (firstha==0)
                        firstha=1;
                        name1=cat(2,dir,'Actuation.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(Actuation(:,1),Actuation(:,22)*(1),color(col))
                    xlim([-10,a1])
                    %ylim([0,18])
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                    
                case 69 %multiplot_M1Voltage & M2Voltage
                    
                    if (firstm==0)
                        firstm=1;
                        name1=cat(2,dir,'MCS_Data.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(MCS_Data(:,1),MCS_Data(:,8)*(1),MCS_Data(:,1),MCS_Data(:,9)*(1));
                    grid on
                    zoom on
                    legend('dcvtg(volts)','dccurrent(Amp)')
                    
                    
                case 70 %multiplot_M1Speed & M2Speed
                    
                    if (firstm==0)
                        firstm=1;
                        name1=cat(2,dir,'MCS_Data.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(MCS_Data(:,1),MCS_Data(:,10)*(1),MCS_Data(:,1),MCS_Data(:,11)*(1))
                    grid on
                    zoom on
                    legend('m1speed','m2speed')
                    
                    %acceleration x
                case 71
                    
                    if (firstc==0)
                        firstc=1;
                        name1=cat(2,dir,'control.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(control(:,1),control(:,20)*(1),color(col))
                    grid on
                    zoom on
                    %legend('m1speed','m2speed')
                    ylabel(yax(p, :));
                    
                    %acceleration y
                case 72
                    
                    if (firstc==0)
                        firstc=1;
                        name1=cat(2,dir,'control.DAT');
                        load(name1)
                    else
                    end
                    
                    plot(control(:,1),control(:,21)*(1),color(col))
                    grid on
                    zoom on
                    %legend('m1speed','m2speed')
                    ylabel(yax(p, :));
                    
                    %acceleration z
                case 73
                    
                    if (firstc==0)
                        firstc=1;
                        name1=cat(2,dir,'control.DAT')
                        load(name1)
                    else
                    end
                    
                    plot(control(:,1),control(:,22)*(1),color(col))
                    grid on
                    zoom on
                    %legend('m1speed','m2speed')
                    ylabel(yax(p, :));
                    % ylabel(yax(p, :));
                    
                case 74 %Spare
                    
                    %if (firsti==0)
                    %   firsti=1
                    name1=cat(2,dir,'INST.DAT')
                    load(name1)
                    %else
                    % end
                    plot(INST(:,1),INST(:,5)*(1),color(col))
                    ylabel(yax(p, :));
                    
                    grid on
                    zoom on
                    
                    
                    %North velocity
                case 75
                    
                    if (firstc==0)
                        firstc=1;
                        name1=cat(2,dir,'control.DAT')
                        load(name1)
                    else
                    end
                    
                    plot(control(:,1),control(:,13)*(1),color(col))
                    ylabel(yax(p, :));
                    
                    grid on
                    zoom on
                    
                case 76   %east velocity
                    
                    if (firstc==0)
                        firstc=1;
                        name1=cat(2,dir,'control.DAT')
                        load(name1)
                    else
                    end
                    
                    plot(control(:,1),control(:,14)*(1),color(col))
                    ylabel(yax(p, :));
                    
                    grid on
                    zoom on
                    
                case 77
                    %muzzle velocity;
                    name1=cat(2,dir,'control.DAT')
                    load(name1)
                    t = control(:,1);
                    l=length(control);
                    xacc=control(:,20);
                    yacc=control(:,21);
                    zacc=control(:,22);
                    %--------------------------------------------------------------------------
                    % X acceleration integration
                    %--------------------------------------------------------------------------
                    vel=zeros(l-4900,1);
                    t_vel=t(4901:l,1);
                    for i=1:1:l-4900-1
                        vel(i+1) = vel(i) + (xacc(i+4900))*(t(i+4900)-t(i+4900-1));
                    end
                    vel=1*vel;
                    figure;plot(t_vel,vel,t,xacc);grid;legend('velocity','acceleration')
                    %--------------------------------------------------------------------------
                    %--------------------------------------------------------------------------
                    
                case 78  %Down velocity
                    if (firstc==0)
                        firstc=1;
                        name1=cat(2,dir,'control.DAT')
                        load(name1)
                    else
                    end
                    
                    plot(control(:,1),control(:,27)*(1),color(col))
                    ylabel(yax(p, :));
                    
                    grid on
                    zoom on
                    
                case 79  %Bists - PIO
                    
                    name1= cat(2,dir,'ALARMS.DAT')
                    load (name1)
                    
                    
                    plot(ALARMS(:,1),ALARMS(:,10),ALARMS(:,1), ALARMS(:,11));%,Bit_Sts(:,1),Bit_Sts(:,4),Bit_Sts(:,1),Bit_Sts(:,5),Bit_Sts(:,1),Bit_Sts(:,6),Bit_Sts(:,1),Bit_Sts(:,7),Bit_Sts(:,1),Bit_Sts(:,8),Bit_Sts(:,1),Bit_Sts(:,9))
                    
                    xlim([-10,a1]);
                    ylim([0,10]);
                    set(gca,'YTick',[2 4]);
                    set(gca,'YTickLabel',{'LCS';'DCO'});
                    grid on
                    zoom on
                    
                case 80 %RecoveryStatus
                    
                    name1= cat(2,dir,'Recovery.DAT');
                    load (name1);
                    plot(Recovery(:,1),Recovery(:,2),Recovery(:,1),Recovery(:,3),Recovery(:,1),Recovery(:,4),Recovery(:,1),Recovery(:,5),Recovery(:,1),Recovery(:,6),Recovery(:,1),Recovery(:,7),Recovery(:,1),Recovery(:,8));
                    xlim([-10,a1]);
                    ylim([0,16]);
                    set(gca,'YTick',[2 4 6 8 10 12 14]);
                    set(gca,'YTickLabel',{'STRS';'MOTOR';'SQUIB';'IPRS';'NM';'GPS';'SM';'MCCS'});
                    grid on
                    zoom on
                    
                case 81  %Power in Watts
                    
                    name1= cat(2,dir,'MCS_Data.DAT')
                    load (name1)
                    plot(MCS_Data(:,1),(MCS_Data(:,8).*MCS_Data(:,9)),color(col))
                    
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                    
                case 82 %HSM FLAG1
                    
                    name1= cat(2,dir,'HSMFLAGS.DAT');
                    load (name1);
                    plot(HSMFLAGS(:,1),HSMFLAGS(:,2),HSMFLAGS(:,1),HSMFLAGS(:,3),HSMFLAGS(:,1),HSMFLAGS(:,4),HSMFLAGS(:,1),HSMFLAGS(:,5),HSMFLAGS(:,1),HSMFLAGS(:,6),HSMFLAGS(:,1),HSMFLAGS(:,7),HSMFLAGS(:,1),HSMFLAGS(:,8),HSMFLAGS(:,1),HSMFLAGS(:,9),HSMFLAGS(:,1),HSMFLAGS(:,10),HSMFLAGS(:,1),HSMFLAGS(:,11),HSMFLAGS(:,1),HSMFLAGS(:,12),HSMFLAGS(:,1),HSMFLAGS(:,13),HSMFLAGS(:,1),HSMFLAGS(:,14),HSMFLAGS(:,1),HSMFLAGS(:,15),HSMFLAGS(:,1),HSMFLAGS(:,16));
                    ylim([-1,32]);
                    set(gca,'YTick',[0 2 4 6 8 10 14 16 18 20 22 24 26 28 30]);
                    set(gca,'YTickLabel',{'BlRangeFlag';'WilksnTurn';'Target Dcted passive';'VCg5';'VCg3';'search pattern';'SteerAwAck';'TargetDetd';'SectorSearch';'LongCntFlag';'SDO';'ISROver';'AcoustcEnable';'SteerAway';'AttckCutof'});
                    
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                    
                case 83   %Horizontal bearing
                    name1= cat(2,dir,'Homing.DAT');
                    load (name1);
                    plot(Homing(:,1),Homing(:,3)*(1),color(col));
                    ylabel(yax(p, :));
                    grid on;
                    zoom on;
                    
                case 84   %HSM Flags2
                    name1= cat(2,dir,'HSMFLAGS.DAT');
                    load (name1);
                    plot(HSMFLAGS(:,1),HSMFLAGS(:,17),HSMFLAGS(:,1),HSMFLAGS(:,18));
                     ylim([31,50]);
                    set(gca,'YTick',[32 35]);
                    set(gca,'YTickLabel',{'Mode';'LFM'});
%                 set(gca,'YTickLabel',{'PassiveMode';'ActiveMode','MixedMode','LFM Hforward';'LFM HReverse';'LFM lowforward';'LFM lowreverse';'Beam Lock/shift';'Beam Scan'});
                   ylabel(yax(p, :));
                    grid on
                    zoom on
                    
                case 85  %vertical bearing
                    
                    name1= cat(2,dir,'Homing.DAT');
                    load (name1);
                    plot(Homing(:,1),Homing(:,5)*(1),color(col));
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                    
                case 86  %Range
                    
                    name1= cat(2,dir,'Homing.DAT')
                    load (name1)
                    plot(Homing(:,1),Homing(:,6)*(1),color(col))
                    
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                    
                case 87  %HSM Search Pattern
                    
                    name1= cat(2,dir,'HSMFLAGS.DAT')
                    load (name1)
                    plot(HSMFLAGS(:,1),HSMFLAGS(:,7)*(1),color(col))
                    
                    set(gca,'YTick',[0 1 2 3]);
                    set(gca,'YTickLabel',{'Straght/Guid';'PortCir';'StbdCir';'ONTangent'});%;'Beamlock';'BeamShift';'PRI';'PassiveBeamScan';'PassiveBeamLock';'PassiveBeamShift'});%;'ISROver';'AcoustcEnable';'SteerAwyPrsent';'AttckCutofPrsent'});
                    ylim([0,6]);
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                    
                case 88 %beam Angle
%                     name1= cat(2,dir,'HSMFLAGS.DAT')
%                     load (name1)
%                     plot(HSMFLAGS(:,1),HSMFLAGS(:,17)*(1),color(col))
%                     
%                     %set(gca,'YTick',[0 1 2 3]);
%                     %set(gca,'YTickLabel',{'Straght/Guid';'PortCir';'StbdCir';'ONTangent'});%;'Beamlock';'BeamShift';'PRI';'PassiveBeamScan';'PassiveBeamLock';'PassiveBeamShift'});%;'ISROver';'AcoustcEnable';'SteerAwyPrsent';'AttckCutofPrsent'});
%                     ylim([0,60]);
%                     ylabel(yax(p, :));
%                     grid on
%                     zoom on
%                     

% APF Range
                     name1= cat(2,dir,'Homing.DAT')
                    load (name1)
                    plot(Homing(:,1),Homing(:,9)*(1),color(col))                    
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                case 89 %SIgnal Type
%                     name1= cat(2,dir,'HSMFLAGS.DAT')
%                     load (name1)
%                     plot(HSMFLAGS(:,1),HSMFLAGS(:,18)*(1),color(col))
%                     
%                     set(gca,'YTick',[0 1 2 3]);
%                     set(gca,'YTickLabel',{'Straght/Guid';'PortCir';'StbdCir';'ONTangent'});%;'Beamlock';'BeamShift';'PRI';'PassiveBeamScan';'PassiveBeamLock';'PassiveBeamShift'});%;'ISROver';'AcoustcEnable';'SteerAwyPrsent';'AttckCutofPrsent'});
%                     ylim([0,6]);
%                     ylabel(yax(p, :));
%                     grid on
%                     zoom on
               
% HSM Noise
                     name1= cat(2,dir,'Homing.DAT')
                    load (name1)
                    plot(Homing(:,1),Homing(:,10)*(1),color(col))                    
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                case 90
                    %RLG Message Error
                    if (firstc==0)
                        firstc=1;
                        name1=cat(2,dir,'control.DAT');
                        load(name1);
                    else
                    end
                    plot(control(:,1),control(:,28)*(1),color(col)) ;
                    ylabel(yax(p, :));
                    xlim([-10,a1]);
                    ylim([-1,50]);
                    grid on
                    zoom on
                    
                case 91
                    %Motor Message Error
                    if (firstc==0)
                        firstc=1;
                        name1=cat(2,dir,'control.DAT');
                        load(name1);
                    else
                    end
                    plot(control(:,1),control(:,25)*(1),color(col)) ;
                    ylabel(yax(p, :));
                    xlim([-10,a1]);
                    ylim([-1,1500]);
                    grid on
                    zoom on
                case 92
                    
                    %Control data Time difference
                    
                    name1=cat(2,dir,'control.dat');
                    load(name1);
                    
                    t1 = control(:,1);
                    N = length(t1);
                    t2 = zeros(1,N);
                    for i=1:(N-1)
                        t2(i+1) = t1(i+1) - t1(i);
                    end
                    figure('Name','Control Data TD');
                    plot(t1,t2);
                    grid on
                    zoom on
                    
                    %Homing data Time difference
                    
                    name1=cat(2,dir,'Homing.DAT');
                    load(name1);
                    
                    t1 = Homing(:,1);
                    N = length(t1);
                    t2 = zeros(1,N);
                    for i=1:(N-1)
                        t2(i+1) = t1(i+1) - t1(i);
                    end
                    figure('Name','Homing Data TD');
                    plot(t1,t2);
                    grid on
                    zoom on
                    
                    %FASC data Time difference
                    
                    name1=cat(2,dir,'Actuation.dat');
                    load(name1);
                    
                    t1 = Actuation(:,1);
                    N = length(t1);
                    t2 = zeros(1,N);
                    for i=1:(N-1)
                        t2(i+1) = t1(i+1) - t1(i);
                    end
                    figure('Name','Actuation Data TD');
                    plot(t1,t2);
                    grid on
                    zoom on
                    %INST data Time difference
                    
                    name1=cat(2,dir,'INST.dat');
                    load(name1);
                    
                    t1 = INST(:,1);
                    N = length(t1);
                    t2 = zeros(1,N);
                    for i=1:(N-1)
                        t2(i+1) = t1(i+1) - t1(i);
                    end
                    figure('Name','INST Data TD');
                    plot(t1,t2);
                    grid on
                    zoom on
                    
                    %MCS data Time difference
                    
                    name1=cat(2,dir,'MCS_Data.dat');
                    load(name1);
                    
                    t1 = MCS_Data(:,1);
                    N = length(t1);
                    t2 = zeros(1,N);
                    for i=1:(N-1)
                        t2(i+1) = t1(i+1) - t1(i);
                    end
                    figure('Name','MCS Data TD');
                    plot(t1,t2);
                    grid on
                    zoom on
                    
                    
                    
                case 93 %CH3  RINS roll
                    if (firsti==0)
                        firsti=1;
                        name1=cat(2,dir,'RINS.DAT');
                        load(name1);
                    else
                    end
%                     plot(vn100(:,1),vn100(:,4)*(1),color(col)) ;
                    plot(RINS(:,1),RINS(:,8)*(1),color(col)) ;
                    ylabel(yax(p, :));
                    ylim([-100,100]);
                    grid on
                    zoom on
                    
                    
                    
                case 94 %CH4  RINS pitch
                    if (firsti==0)
                        firsti=1;
                        name1=cat(2,dir,'RINS.DAT');
                        load(name1);
                    else
                    end
%                     plot(vn100(:,1),vn100(:,3)*(1),color(col)) ;
                    plot(RINS(:,1),RINS(:,9)*(1),color(col)) ;
                    ylabel(yax(p, :));
                    ylim([-100,100]);
                    grid on
                    zoom on
                    
                    
                case 95 %CH5 RINS yaw
                    if (firsti==0)
                        firsti=1;
                        name1=cat(2,dir,'RINS.DAT');
                        load(name1);
                    else
                    end
                    plot(RINS(:,1),RINS(:,10)*(1),color(col)) ;
                    ylabel(yax(p, :));
                    ylim([-190,190]);
                    grid on
                    zoom on
                    
                case 96 %CH6  RINS RATE _X
                    if (firsti==0)
                        firsti=1;
                        name1=cat(2,dir,'RINS.DAT');
                        load(name1);
                    else
                    end
                    plot(RINS(:,1),RINS(:,2)*(1),color(col)) ;
                    ylabel(yax(p, :));
                    ylim([-20,20]);
                    grid on
                    zoom on
                    
                                  
                    
                case 97 %CH7   RINS RATE _ Y
                    if (firsti==0)
                        firsti=1;
                        name1=cat(2,dir,'RINS.DAT');
                        load(name1);
                    else
                    end
                    plot(RINS(:,1),RINS(:,3)*(1),color(col)) ;
                    ylabel(yax(p, :));
                    ylim([-20,20]);
                    grid on
                    zoom on
                    
                case 98 %CH8  RINS RATE_Z
                    if (firsti==0)
                        firsti=1;
                        name1=cat(2,dir,'RINS.DAT');
                        load(name1);
                    else
                    end
                    plot(RINS(:,1),RINS(:,4)*(1),color(col)) ;
                    ylabel(yax(p, :));
                    ylim([-20,20]);
                    grid on
                    zoom on
                    
                case 99 %CH9  RINS ACC _ X
                    if (firsti==0)
                        firsti=1;
                        name1=cat(2,dir,'RINS.DAT');
                        load(name1);
                    else
                    end
                    plot(RINS(:,1),RINS(:,5)*(1),color(col)) ;
                    ylabel(yax(p, :));
%                     ylim([-60,10]);
                    legend('color');
                    grid on
                    zoom on
                    
                case 100 %CH500V       RINS ACC_Y foc CMDS Search Speed
                    if (firsti==0)
                        firsti=1;
                        name1=cat(2,dir,'RINS.DAT');
                        load(name1);
                    else
                    end
                    plot(RINS(:,1),RINS(:,6)*(1),color(col)) ;
                    ylabel(yax(p, :));
%                     ylim([0,60]);
                    grid on
                    zoom on
                    
                case 101 %CH65V  foc CMDS   RINS ACC_Z
                    if (firsti==0)
                        firsti=1;
                        name1=cat(2,dir, 'RINS.DAT');
                        load(name1);
                    else
                    end
                    plot(RINS(:,1),RINS(:,7)*(1),color(col)) ;
                    ylabel(yax(p, :));
%                     ylim([-6,6]);
                    grid on
                    zoom on
                    
                    case 102  %Range
                    
                    name1= cat(2,dir,'Presetter.DAT')
                    load (name1)
                    plot(Presetter(:,24),Presetter(:,27)*(1),color(col))
                    
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                    
                     case 103  %Range
                    
                    name1= cat(2,dir,'Presetter.DAT')
                    load (name1)
                    plot(Presetter(:,24),Presetter(:,28)*(1),color(col))
                    
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                     case 104  %Range
                    
                    name1= cat(2,dir,'Presetter.DAT')
                    load (name1)
                    plot(Presetter(:,24),Presetter(:,29)*(1),color(col))
                    
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                    
                    case 105  %Range
                    
                    name1= cat(2,dir,'Presetter.DAT')
                    load (name1)
                    plot(Presetter(:,24),Presetter(:,30)*(1),color(col))
                    
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                    
                    case 106  %Range
                    
                    name1= cat(2,dir,'Presetter.DAT')
                    load (name1)
                    plot(Presetter(:,24),Presetter(:,31)*(1),color(col))
                    
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                    
                    
                    
                    case 107  %Range
                    
                    name1= cat(2,dir,'Presetter.DAT')
                    load (name1)
                    plot(Presetter(:,24),Presetter(:,32)*(1),color(col))
                    
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                    
                    
                    case 108  %Range
                    
                    name1= cat(2,dir,'Presetter.DAT')
                    load (name1)
                    plot(Presetter(:,24),Presetter(:,33)*(1),color(col))
                    
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                    
                    
                      case 109  %Range
                    
                    name1= cat(2,dir,'Presetter.DAT')
                    load (name1)
                    plot(Presetter(:,24),Presetter(:,34)*(1),color(col))
                    
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                    
                    
                        case 110  %Range
                    
                    name1= cat(2,dir,'Presetter.DAT')
                    load (name1)
                    plot(Presetter(:,24),Presetter(:,35)*(1),color(col))
                    
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                    
                    
                        case 111  %Range
                    
                    name1= cat(2,dir,'Presetter.DAT')
                    load (name1)
                    plot(Presetter(:,24),Presetter(:,36)*(1),color(col))
                    
                    ylabel(yax(p, :));
                    grid on
                    zoom on
                    case 112  %MCCS_HOMING flags 
                    
%                     name1= cat(2,dir,'MCCSFlags.DAT');
%                     load (name1)
%                     plot(MCCSFlags(:,1),MCCSFlags(:,22),MCCSFlags(:,1),MCCSFlags(:,23),MCCSFlags(:,1),MCCSFlags(:,24),MCCSFlags(:,1),MCCSFlags(:,25),MCCSFlags(:,1),MCCSFlags(:,26),MCCSFlags(:,1),MCCSFlags(:,27));
%                     xlim([-10,a1])
% %                     ylim([1,10])
%                     set(gca,'YTick',[ 1 3 5 7 9 11 13]);
%                     set(gca,'YTickLabel',{'Streeaway/W22/M12';'Attack cutoff';'safety wall';'Torpedo left the Tube';'wire guidance';' APF status(BC-RT)'})
%                     ylabel(yax(p, :));
                    
                    name1= cat(2,dir,'MCCSFlags.DAT');
                    load (name1);
                    plot(MCCSFlags(:,1),MCCSFlags(:,22),MCCSFlags(:,1),MCCSFlags(:,23),MCCSFlags(:,1),MCCSFlags(:,24),MCCSFlags(:,1),MCCSFlags(:,25),MCCSFlags(:,1),MCCSFlags(:,26),MCCSFlags(:,1),MCCSFlags(:,27),MCCSFlags(:,1),MCCSFlags(:,28),MCCSFlags(:,1),MCCSFlags(:,29),MCCSFlags(:,1),MCCSFlags(:,30));
                    set(gca,'YTick',[40 42 44 46 48 50 52 54 57]);
%                     set(gca,'YTickLabel',{'PassiveMode';'ActiveMode';'APF';'BeamScan';'Beamlock';'BeamShift';'PRI';'PassiveBeamScan';'PassiveBeamLock';'PassiveBeamShift'});%;'ISROver';'AcoustcEnable';'SteerAwyPrsent';'AttckCutofPrsent'});
                set(gca,'YTickLabel',{'steer away ';'attack cutoff';'safety wall';'Torpedo left D tube ';'wire guidance';'APF status';'Target acquired(HC)';'Mode';'BC-RT Mode'});%;'ISROver';'AcoustcEnable';'SteerAwyPrsent';'AttckCutofPrsent'});
                   ylim([38,62]);
                   ylabel(yax(p, :));
                    grid on
                    zoom on
                 case 113  %Range
                    
                    name1= cat(2,dir,'INST.DAT');
                    load (name1)
                    plot(INST(:,1),INST(:,14)*(1),color(col))
                    
                    ylabel(yax(p, :));
                    grid on
                    zoom on    
            end    
            
            if (prev==1)
                hold on;
                %legend on;
                col=col+1;
                %ylabel(yax(p, :));
                %for x=0:col
                legend(yax(p, :));
                %end
                if (col==8)
                    col=1;
                end
                
            end
            
            xlabelname='Time (sec)';
            
            xlabel(xlabelname);
            
            
            if(axsed==1)
                xlabelname='Distance(Meters)';
                
                xlabel(xlabelname)
                axsed=0
            else
                xlabelname='Time (sec)';
                
                xlabel(xlabelname)
            end
            %  ylabel(yax(p, :));
            
            
            if(p > 1)
                xlim([-50,a1]);
            end
            
            order=int2str(p);
            title1=cat(2,i,'         ',order);
            
            title(title1,'fontsize',13);
            grid on;
            zoom on;
            orient landscape
            
        end
        
    end
end
