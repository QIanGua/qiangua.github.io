---
title: A Script Snippet to Go Through A Directory
tags: Matlab
date: 2019-10-09
categories: script
---

In order to avoid repeat operations, I need to write a script to do the repeated word. Here is a snippet using in Matlab. This post is just as a
backup.

```matlab
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Code Name: 
% Coder: Author
% date: 2019-10-09  %C-t
% description:
% Input module: 
% Output data:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setting the File Path
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

path='.../date_initial/';
dir_dat = dir(strcat(path,'*.dat'));

% cd to save directory
cd('.../date_final');

% number of files
file_number = length(dir_dat);

% name list of files with string type
file_name_arr = string ( {dir_dat.name}' );


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Loop to read, process and save data files
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for loop_idx = 1:file_number
    
    % # read in data
    file_address = strcat( path,  file_name_arr(loop_idx)  );
    data = dlmread(  file_address );
    
    % # process data
    
    
        
    % # out_put data plot if necessary 
    %　save data with name rule
   
    out_put= ;    
    out_name = strcat( file_name_arr(loop_idx), '_susceptibility', '.dat')
    save(out_name,'out_put','-ascii','-double'); 
end

```

