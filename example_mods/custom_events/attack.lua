local isDodged = false;
local hitCount;

function onEvent(name,value1,value2)
    if (name == 'attack') then
        playAnim('dad','attack',true);
        runTimer('attackTimer',0.5);
        setProperty('FlxG.camera.zoom',setProperty('camGame.zoom' + 0.3));
    end
end

function onTimerCompleted(tag, loops, loopsLeft) 
    if (tag == 'attackTimer') then
        setProperty('slash.visible',true);
        objectPlayAnimation('slash','slash');
        runTimer('slash',0.45);
        if (isDodged == false) then
            playAnim('boyfriend','hurt');
            runTimer('hit',0.5,25);
            setProperty('health',getProperty('health') - 0.1)
            setProperty('bubbles.visible',true)
        end
    end
    if (tag == 'bfDodge') then
        isDodged = false;
    end
    if (tag == 'hit') then
        setProperty('health',getProperty('health') - 0.05)
        cameraShake('camGame',0.01,0.075);
        if (loopsLeft == 0) then
            setProperty('bubbles.visible',false);
        end
    end
    if (tag == 'slash') then
        setProperty('slash.visible',false);
        setProperty('FlxG.camera.zoom' - 0.3)
    end
end

function onUpdatePost() 
    if (keyJustPressed('space')) then
        playAnim('boyfriend','dodge');
        isDodged = true;
        runTimer('bfDodge',0.5);
    end
    setProperty('bubbles.x',getProperty('iconP1.x') + getProperty('iconP1.width') - 35);
    setProperty('bubbles.y',getProperty('iconP1.y'));
end


function onCreatePost()
    makeAnimatedLuaSprite('slash','slash',getProperty('boyfriend.x')-10,getProperty('boyfriend.y')-10);
    addAnimationByPrefix('slash','slash','slash_cut',24,false);
    addLuaSprite('slash',true)
    setProperty('slash.visible',false);

    makeLuaSprite('bubbles','iconDie',getProperty('iconP1,x'),getProperty('iconP1.y'))
    addLuaSprite('bubbles',true);
    setObjectCamera('bubbles','camHUD');
    setProperty('bubbles.visible',false);
    scaleObject('bubbles',0.75,0.75)
end