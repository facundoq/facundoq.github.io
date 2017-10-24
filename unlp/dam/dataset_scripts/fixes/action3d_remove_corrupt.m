function gestures = action3d_remove_corrupt(gestures)

% if we don't fix this gestures, we should remove them
% (class,subject,instance)
fix_wrong_frames_or_remove=[ ...
    46 ... %(2,8,)
    312 ... % (12,3,) : first frames
    531,534,535,536,546,549,551,552, 556,557 ...% class 20 (bend)
    442 ... %(17,1,2)
    ];
%(class,subject,instance)
remove=[ ...
    4 ... % (1,2,) 
    5 ... % (1,2,) 
    447 ... % (17,3,)
    477 ... % (18,3,1)
    478 ... % (18,3,2)
    479 ... % (18,3,3)
    501 ... % (19,1,1)
    510 ... % (19,4,1)
    ... % Clase 13: Son muchos, yo sacaría todos directamente.
    350 ... % (13,6,1) se corta al final
    351 ... % (13,6,2) se corta al final
    352 ... % (13,6,3) se corta al final
    356 ... % (13,8,) se desarma todo
    357 ... % (13,8,) se corta al final
    360 ... % (13,10,) se corta al final
    335 ... % (13,1,) se desarma todo
    336 ... % (13,1,) se desarma todo
    339 ... % (13,2,) se corta al final
    347 ... % (13,4,) no se agacha
    ];

remove_all= [fix_wrong_frames_or_remove remove];

fprintf('Actions removed (class,person,instance):\n');
for i=remove_all
    fprintf('%d,%d,%d\n',gestures(i).y,gestures(i).person,gestures(i).instance);
end

gestures(remove_all)=[];


end