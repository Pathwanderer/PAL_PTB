
function rsvp(need,name,subjectid)

%%%%%   ��������������������������ֵ

%% need  ��֮ǰ�涨��һ���� 2 ����λ�úʹ�С���������ֲ�����λ��
%% name  ÿ�����Ե����ֱ��  ��ͨ��������ĸ���确gx�����ǵ�Ҫ������

%% ���磬rsvp_v2(1,1,'gx')  ��ʾ  gx �ĵ�һ��block������Ҫ����λ�á�
%% subjectid  ������ţ�����ż��
%%�ģ�������ĸ��21����λ�������������䡢ʵ�����ָ����
%%�飺RT�ռ����޸������⣩��targetû�Ȱ�������
Screen('Preference', 'SkipSyncTests', 1);
jiou=[];
if mod(subjectid,2)==1;
    jiou=1;
elseif  mod(subjectid,2)==0;
    jiou=2;
end
trialnum=50;
blocknum=8;
letternum=15;

balance=1

qujian=5;
for block=1:blocknum
    
    
    target_letter=[];
    % block=2;
    if block==1
        alltargetletter=[Shuffle([1:4,1:4])];
        
        for i=1:length(alltargetletter)-1
            while alltargetletter(i+1)==alltargetletter(i)
                alltargetletter(i+1:end)=Shuffle(alltargetletter(i+1:end));
            end
        end
        save([name,'_alltargetletter'],'alltargetletter');
    end
    
    load([name,'_alltargetletter.mat']);
    target_letter=alltargetletter(block);
    
    
    
    
    %target_pos=[]; %target_pos1=[];
%     t1=[ones(1,trialnum/qujian),ones(1,trialnum/qujian)*2,ones(1,trialnum/qujian)*3,ones(1,trialnum/qujian)*4,ones(1,trialnum/qujian)*5,ones(1,trialnum/qujian)*6,ones(1,trialnum/qujian)*7];
%t1=[repmat(2:6,1,trialnum/qujian)];    

% t2=repmat(1:3,1,trialnum/3);
%t2=randsample(1:3,trialnum,'true');

    %t3=t1*3-t2+1;
    %     target_pos1=[t1;t2;t3];
    %target_pos=[t1;t2;t3];
    %
    %     r=randperm( length(t1) );   %���ɹ������������������������
    %
    %     target_pos=target_pos1(:,r);
    %     paramatrix=paramatrix1(:, r);
    % need=0;  %% �����2  �����cue  ����ĸ�Ĵ�С λ��
    
    
    blue=[255,255,255];yellow=[255,255,255]; red=[255,255,255]; green=[255,255,255]; gray=[255,255,255]; white=[255,255,255];  black=[0 0 0]; white1=[255,255,255];
    colorset=[blue;yellow;red;green;gray;white];
    letterset={'F','H','R','T','f','h','r','t'};
    
    
    
    %% KEY
    keycode=zeros(1,256);
    keyz=KbName('z');
    keyxie=KbName('m');
    quitkey=KbName('q');
    keyx=KbName('x');
    keyd=KbName('d');
    
    uparrow=KbName('up');
    downarrow=KbName('down');
    leftarrow=KbName('left');
    rightarrow=KbName('right');
    
    %%  1 blue 2 yellow  3red    4green 5gray  6white
    paramatrix1=[];  paramatrix=[];
%     trialnum=50;
%     paramatrix1(1,:)=[ones(1,round(trialnum*0.8*0.5)),zeros(1,round(trialnum*0.2*0.5)),ones(1,round(trialnum*0.8*0.5)),zeros(1,round(trialnum*0.2*0.5))]; % ��Ч1  ��Ч0
        %paramatrix1(1,:)=[ones(1,round(trialnum*0.8)),zeros(1,round(trialnum*0.2))]; % ��Ч1  ��Ч0
%     paramatrix1(1,:)=[ones(1,round(trialnum*0.5*0.8)),zeros(1,round(trialnum*0.5*0.2)),ones(1,round(trialnum*0.5*0.8)),zeros(1,round(trialnum*0.5*0.2))];
    %paramatrix1(2,:)=target_pos(3,:);  %% �����ڵڼ���
        
    paramatrix1(2,:)=[ones(1,round(trialnum*0.5))*5,  ones(1,round(trialnum*0.5))*11]; 
    
        %%����������ʱ��λ��Ԥ�����Ч����Ϣ%%
    cue_va1=[ones(1,round(trialnum*0.5*0.8)),zeros(1,round(trialnum*0.5*0.2))];
    cue_va2=[ones(1,round(trialnum*0.5*0.8)),zeros(1,round(trialnum*0.5*0.2))];
%     r_cue_va1=Shuffle(cue_va1);   r_cue_va2=Shuffle(cue_va2);

    col_va1=[ones(1,round(trialnum*0.5*0.8*0.8)),zeros(1,round(trialnum*0.5*0.8*0.2)),ones(1,round(trialnum*0.5*0.2*0.8)),zeros(1,round(trialnum*0.5*0.2*0.2))];
    col_va2=[ones(1,round(trialnum*0.5*0.8*0.8)),zeros(1,round(trialnum*0.5*0.8*0.2)),ones(1,round(trialnum*0.5*0.2*0.8)),zeros(1,round(trialnum*0.5*0.2*0.2))];
%     r_col_va1=Shuffle(col_va1);   r_col_va2=Shuffle(col_va2);
    
    for c=1:trialnum*0.5;
        paramatrix1(1,c)=col_va1(c);
        paramatrix1(1,c+trialnum*0.5)=col_va2(c);
        paramatrix1(4,c)=cue_va1(c);
        paramatrix1(4,c+trialnum*0.5)=cue_va2(c);
    end
    
    %%%%%

    r=randperm( size(paramatrix1,2) );   %���ɹ������������������������
    paramatrix=paramatrix1(:, r);                              %����������ж�A������������
    paramatrix(3,:)=Shuffle([ones(1,round(trialnum*0.5)),zeros(1,round(trialnum*0.5))+2]);  %% ��Сд

    
    
    
    
    %%%%%%% ����Ŀ����ĸ
    %
    % target_letter=zeros(2,trialnum);
    % target_letter(1,:)=randsample(1:8,trialnum,true); %% ��ĸ����
    % for i=1:length(target_letter)-1
    %     while target_letter(1,i)==target_letter(1,i+1)
    %         target_letter(1,i+1:end)= Shuffle(target_letter(1,i+1:end));
    %         if ~all(diff(target_letter(1,i:end)))
    %             target_letter(1,i+1)=randsample(setdiff(1:8,target_letter(1,i)),1);
    %         end
    %     end
    %
    %     if target_letter(1,i)<=4
    %         target_letter(2,i)=2;
    %     else
    %         target_letter(2,i)=1;
    %     end
    % end
    
    
    %%%% Ŀ����ĸ��ɫ
    
    target_letter_color=zeros(1,trialnum);
    target_letter_color(1,:)=randsample(1:6,trialnum,true); %% ��ĸ����
    for i=1:length(target_letter_color)-1
        while target_letter_color(1,i)==target_letter_color(1,i+1)
            target_letter_color(1,i+1:end)= Shuffle(target_letter_color(1,i+1:end));
            if ~all(diff(target_letter_color(1,i:end)))
                target_letter_color(1,i+1)=randsample(setdiff(1:6,target_letter_color(1,i)),1);
            end
            
        end
        
        
    end
    
    
    %%%% ��ĸ��ɫ����
    allletter_color=zeros(letternum,trialnum);
    
    for i=1:trialnum
        if  paramatrix(1,i)==1  %% valid
            allletter_color(:,i)=randsample(setdiff(1:6,target_letter_color(1,i)),size(allletter_color,1),true)';
            allletter_color(paramatrix(2,i),i)=target_letter_color(1,i);
        elseif paramatrix(1,i)==0  %% invalid
            allletter_color(:,i)=randsample(setdiff(1:6,target_letter_color(1,i)),size(allletter_color,1),true)';
        end
    end
    
    %%%%%%%%%%%%%     ����ÿ��trial����ĸ����%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    allletter=zeros(letternum,trialnum);
    for i=1:trialnum
        leftletter=[];
        thisseries=[];
        if paramatrix(3,i)==1
            allletter(paramatrix(2,i),i)=target_letter;
        elseif paramatrix(3,i)==2
            allletter(paramatrix(2,i),i)=target_letter+4;
            
        end
        
        
        
        
        if allletter(paramatrix(2,i),i)>4   %% �ų�����Ŀ����ĸ
            leftletter=setdiff(1:8,[ allletter(paramatrix(2,i),i), allletter(paramatrix(2,i),i)-4]);
        else
            leftletter= setdiff(1:8,[ allletter(paramatrix(2,i),i), allletter(paramatrix(2,i),i)+4]);
        end
        
        thisseries=randsample(leftletter,letternum-1,true);
        for k=1:letternum-1-1
            
            while thisseries(k)==thisseries(k+1)
                thisseries(k+1)= randsample(setdiff(leftletter,thisseries(k)),1);
            end
            
        end
        allletter(1:paramatrix(2,i)-1,i)=thisseries(1:paramatrix(2,i)-1)';
        allletter((paramatrix(2,i)+1):end,i)=thisseries(paramatrix(2,i):end)';
    end
    
    
    
    
    %%  ���  ÿ��trial���������Ƿ����ظ���
    for i=1:trialnum
        for j=1:letternum-1
            if allletter(j,i)== allletter(j+1,i)
                
                error('error')
            end
        end
    end
    
    
    for i=1:trialnum
        if paramatrix(3,i)==1
            if allletter(paramatrix(2,i),i)>4
                error('error');
            end
        else
            if allletter(paramatrix(2,i),i)<=4
                error('error');
            end
        end
    end
    %%%  ����Щ������ֵ��paramatrix
    paramatrix(5:5+letternum-1,:)=allletter;
    paramatrix(5+letternum,:)=target_letter_color;
    paramatrix(5+letternum+1:5+letternum+1+letternum-1,:)=allletter_color;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    %% ��ʼ��ʾ
    background=[0 0 0];
    
    
    
    
    % KbWait;
    if block==1
        [win,rect]=Screen('OpenWindow',0,background);
    end
    
    ifi=Screen('GetFlipInterval', win);

    
    HideCursor
    % [win,rect]=Screen('OpenWindow',0,background,[0 0 600 600]);
    [centerX,centerY]=RectCenter(rect);
    mon_width=40;
    v_dist=51;
    ppd = pi * (rect(3)-rect(1)) / atan(mon_width/v_dist/2) / 360;
    rfix   = 0.3*ppd;                      % radius of fixation
    % fix_pos=[centerX-rfix,centerY-rfix,centerX+rfix,centerY+ rfix];
    isi=8;   %%%%%%%%%%%%%%  ע��������ȡ��isi������ĳ�0������������
    
    
    
    
    
    
    if need==2;
        
        %         blocktarget=randsample(1:8,6);
        
        
        %%  ������ĸ��С������λ��
        
        Screen('TextFont',win,'Times New Roman');
        
        Screen('TextStyle',win,1);
        
        
        textsize=30;
        
        targetsize=30;
        
        
        
        DrawFormattedText(win, '����Ŀ����ĸ',  'center',  'center', white1);
        Screen('Flip',win);
        KbWait;
        
        for i=1:10000
            
            
            Screen('TextSize',win,targetsize);
            DrawFormattedText(win, 'R',  'center',  'center', white1);
            Screen('Flip',win);
            
            [keyIsDown secs keycode]=KbCheck;
            if keyIsDown
                if keycode(uparrow)
                    targetsize=targetsize+1;
                elseif keycode(downarrow)
                    targetsize=targetsize-1;
                elseif keycode(quitkey)
                    disp(['targetsize is ',num2str(targetsize)])
                    break
                    
                    
                end
                
                
            end
            
        end
        WaitSecs(0.1);
        
        
        DrawFormattedText(win, '������������ĸ',  'center',  'center', white1);
        Screen('Flip',win);
        KbWait;
        
        for i=1:10000
            
            
            Screen('TextSize',win,textsize);
            DrawFormattedText(win, 'R',  'center',  'center', white1);
            Screen('Flip',win);
            
            [keyIsDown secs keycode]=KbCheck;
            if keyIsDown
                if keycode(uparrow)
                    textsize=textsize+1;
                elseif keycode(downarrow)
                    textsize=textsize-1;
                elseif keycode(quitkey)
                    disp(['textsize is ',num2str(textsize)])
                    break
                    
                    
                end
                
                
            end
            
        end
        WaitSecs(0.1);
        %%target size
        
        
        
        
        %%  ��������λ��
        
        % fix_pos=[centerX-3*rfix,centerY-rfix,centerX+3*rfix,centerY+ rfix];
        for i=1:10000
            
            fix_pos=[centerX-rfix,centerY-rfix,centerX+rfix,centerY+ rfix];
            keycode=zeros(1,256);
            
            
            
            
            DrawFormattedText(win, 'R',  'center',  'center', white1);
            DrawFormattedText(win, '+',  'center',  'center', white1);
            Screen('FillRect',win,[255 255 255],fix_pos);
            Screen('Flip',win);
            
            [keyIsDown secs keycode]=KbCheck;
            if keyIsDown
                if keycode(uparrow)
                    centerY=centerY-1;
                elseif keycode(downarrow)
                    centerY=centerY+1;
                elseif keycode(leftarrow)
                    centerX=centerX-1;
                elseif keycode(rightarrow)
                    centerX=centerX+1;
                elseif keycode(keyd)
                    rfix=rfix+0.5;
                elseif keycode(keyx)
                    rfix=rfix-0.5;
                    
                    
                    
                elseif keycode(quitkey)
                    disp(['cueposition is ',num2str(fix_pos)])
                    break
                    
                    
                end
                
                
            end
            
        end
        
        
        save('sizepara','rfix','fix_pos','textsize','targetsize');
    end
    %     Screen('closeall')

    
    load('sizepara.mat')
    fix_pos1=zeros(1,4); fix_pos2=zeros(1,4);

            fix_pos1(1)=fix_pos(1)-9*rfix;  fix_pos1(2)=fix_pos(2);   fix_pos1(3)=fix_pos(3)+9*rfix;   fix_pos1(4)=fix_pos(4);
            fix_pos2(1)=fix_pos(1)-3*rfix;  fix_pos2(2)=fix_pos(2);   fix_pos2(3)=fix_pos(3)+3*rfix;   fix_pos2(4)=fix_pos(4);


    Screen('TextSize',win,targetsize);
    Screen('TextFont',win,'Times New Roman');
    
    Screen('TextStyle',win,1);
    
    keycode=zeros(1,256);
    
    response=zeros(trialnum,3);
    
    
    k=1;
    
    if jiou==1
        DrawFormattedText(win, ['Ŀ����ĸ��',letterset{target_letter},'\n\n', '���д����Z,','','Сд����M\n\n' ,'�����������' ],  'center',  'center', white1);
    elseif jiou==2
        DrawFormattedText(win, ['Ŀ����ĸ��',letterset{target_letter},'\n\n', '���д����M,','','Сд����Z\n\n' ,'�����������' ],  'center',  'center', white1);
    end
    Screen('Flip',win);
    KbWait;   %%%%%%%%%�����һ�������ȴ���Ҳ���Ǳ��Կ�������������������Ȼ���Կ���û�п������ �粻��Ҫ���뽫����ȥ��
    WaitSecs(0.5);
    while  k<=trialnum  && ~keycode(quitkey)
        keycode=zeros(1,256);
        %% Ŀ����ĸ
        
        %% ע�ӵ�
        Screen('TextSize',win,textsize);
        
        DrawFormattedText(win, '+',  'center',  'center', white1);
        %       Screen('FillRect',win,colorset(target_letter_color(1,k),:),fix_pos);
        Screen('Flip',win);
        WaitSecs(0.8);
        
        
        %% cue
% if balance==1;
        if paramatrix(4,k)==1

            if paramatrix(2,k)==5;
                Screen('FillRect',win,colorset(target_letter_color(1,k),:),fix_pos2);
            else 
                Screen('FillRect',win,colorset(target_letter_color(1,k),:),fix_pos1);
            end
            
        else 
            
            if paramatrix(2,k)==5;
                Screen('FillRect',win,colorset(target_letter_color(1,k),:),fix_pos1);
            else 
                Screen('FillRect',win,colorset(target_letter_color(1,k),:),fix_pos2);
            end
        end
        Screen('Flip',win);
        
% else
%         if block>3;
% 
%             if paramatrix(2,k)==5;
%                 Screen('FillRect',win,colorset(target_letter_color(1,k),:),fix_pos2);
%             else 
%                 Screen('FillRect',win,colorset(target_letter_color(1,k),:),fix_pos1);
%             end
%             
%         else 
%         
%                 Screen('FillRect',win,colorset(target_letter_color(1,k),:),fix_pos);  
%         end
%         Screen('Flip',win);
%  end         
     
        WaitSecs(1);
        Screen('FillRect',win,black);
        Screen('Flip',win);
        WaitSecs(0.08);
        timeStart=GetSecs;
        targetdur=5;   %% ע�⣬������target�ĳ���ʱ�䣨duration��  5 ��ʾ5֡
        %kkk=0;
        
        Screen('TextSize',win,textsize);
        %% RSVP
        for n=1:letternum
            
            for f=1:targetdur
                DrawFormattedText(win, letterset{allletter(n,k)}, 'center',  'center', colorset(allletter_color(n,k),:));
                Screen('Flip',win);
            end  
            
            for ff=1:isi
            Screen('FillRect',win,black);
            Screen('Flip',win);
            end
            
        end
        
        Screen('FillRect',win,black);
        Screen('Flip',win);
        WaitSecs(0.08);
        
        timeStart=GetSecs;
        for i=1:200
                DrawFormattedText(win, '?', 'center',  'center', white1);
                Screen('Flip',win);
                
                [keyIsDown secs keycode]=KbCheck;
                if keyIsDown
                    if keycode(keyz)
                        response(k,1)=1;
                       response(k,2)=secs-timeStart;
                        break
                        %kkk=1;
                        %                         disp(keycode)
                        %                                    error('error')
                        
                        
                    elseif keycode(keyxie)
                        response(k,1)=2;
                      response(k,2)=secs-timeStart;
                      break
                        %kkk=1;
                        
                    elseif keycode(quitkey)
                        break
                        
                    end
                end
        end 
             k=k+1;
                
            
            %for ff=1:isi
                %Screen('FillRect',win,black);
                %Screen('Flip',win);
                %[keyIsDown secs keycode]=KbCheck;
                %                   disp(keycode)
                %                   break
                %if keyIsDown
                    %if keycode(keyz)
                        %response(k,1)=1;
                        %response(k,2)=secs-timeStart-((targetdur+isi)*ifi*(paramatrix(2,k)-1)+0.001);
                        %kkk=1;
                        %                                             break
                        
                        
                    %elseif keycode(keyxie)
                        %response(k,1)=2;
                        %response(k,2)=secs-timeStart-((targetdur+isi)*ifi*(paramatrix(2,k)-1)+0.001);
                        %                                             break
                        %kkk=1;
                    %elseif keycode(quitkey)
                        %break
                        
                    %end
                %end
                %                 WaitSecs(0.08);
            %end
        %         disp(keycode);
        
        %if kkk==1
            %Screen('FillRect',win,black);
            %Screen('Flip',win);
            %             disp('111')
            %             error('error');
            %WaitSecs(1);
            
        %else
            
            %for i=1:200
                
                %      DrawFormattedText(win, '?', 'center',  'center', colorset(allletter_color(n,k),:));
                %             DrawFormattedText(win, '?', 'center',  'center', white);
                %Screen('FillRect',win,black);
                %Screen('Flip',win);
                
                %[keyIsDown secs keycode]=KbCheck;
                %if keyIsDown
                    %if keycode(keyz)
                        %response(k,1)=1;
                        %response(k,2)=secs-timeStart-((targetdur+isi)*ifi*(paramatrix(2,k)-1)+0.001);
                        %break
                        
                        
                    %elseif keycode(keyxie)
                        %response(k,1)=2;
                        %response(k,2)=secs-timeStart-((targetdur+isi)*ifi*(paramatrix(2,k)-1)+0.001);
                        %break
                        
                    %elseif keycode(quitkey)
                        %break
                        
                    %end
                %end
                
            %end
            
        %end
        
        
        
        
                 Screen('FillRect',win,black);
                 Screen('Flip',win);
                 WaitSecs(0.8);
        
    end
    if jiou==1;  %% ��дz  Сд m
        for jjj=1:trialnum
            if response(jjj,1)==paramatrix(3,jjj)
                response(jjj,3)=1;
            end
        end
    elseif  jiou==2
        for jjj=1:trialnum
            if (response(jjj,1)==2 && paramatrix(3,jjj)==1) || (response(jjj,1)==1 && paramatrix(3,jjj)==2)
                response(jjj,3)=1;
            end
        end
    end
    
    
    
    save([name,'_',num2str(block),'_parameter'],'response','paramatrix','target_letter_color','target_letter','allletter','allletter_color');
    if keycode(quitkey)
        break
    end
    
    % for
    
    
    if block==blocknum
        Screen('FillRect',win,black);
        DrawFormattedText(win, 'ʵ���������л���Ĳ��룡',  'center',  'center', white1);
        Screen('Flip',win);
        WaitSecs(2)
        
        
    elseif block==5&&balance==1||block==3&&balance==2;
        Screen('FillRect',win,black);
        DrawFormattedText(win, '����Ϣ����Ϣ�ú������������ע�⣬֮�����ʱ����������ı䡣',  'center',  'center', white1);
        Screen('Flip',win);
        KbWait;
           WaitSecs(0.5)
           
           
    else
        
        Screen('FillRect',win,black);
        DrawFormattedText(win, '����Ϣ����Ϣ�ú������������',  'center',  'center', white1);
        Screen('Flip',win);
        KbWait;
           WaitSecs(0.5)  
    end
end 
Screen('closeall');














