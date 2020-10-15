var cmanLinkScrollCns = {};
cmanLinkScrollCns["moveWidth"] = 3;
cmanLinkScrollCns["moveTime"] = 20;
cmanLinkScrollCns["movePar1"]  = '0.009,0.027,0.055,0.091,0.136,0.191,0.255,0.327,0.409,0.5,0.591,0.673,0.745,0.809,0.864,0.909,0.945,0.973,0.991,1';
cmanLinkScrollCns["movePar2"]  = '0.011,0.033,0.067,0.111,0.167,0.233,0.311,0.4,0.5,0.6,0.689,0.767,0.833,0.889,0.933,0.967,0.989,1';
cmanLinkScrollCns["movePar3"]  = '0.014,0.042,0.083,0.139,0.208,0.292,0.389,0.5,0.611,0.708,0.792,0.861,0.917,0.958,0.986,1';
cmanLinkScrollCns["movePar4"]  = '0.018,0.054,0.107,0.179,0.268,0.375,0.5,0.625,0.732,0.821,0.893,0.946,0.982,1';
cmanLinkScrollCns["movePar5"]  = '0.024,0.071,0.143,0.238,0.357,0.5,0.643,0.762,0.857,0.929,0.976,1';
cmanLinkScrollCns["movePar6"]  = '0.033,0.1,0.2,0.333,0.5,0.667,0.8,0.9,0.967,1';
cmanLinkScrollCns["movePar7"]  = '0.05,0.15,0.3,0.5,0.7,0.85,0.95,1';
cmanLinkScrollCns["movePar8"]  = '0.083,0.25,0.5,0.75,0.917,1';
cmanLinkScrollCns["movePar9"]  = '0.167,0.5,0.833,1';
cmanLinkScrollCns["movePar10"] = '1';
var cmanLinkScrollWk  = {};
function cmanLinkScroll(argID){
    cmanLinkScrollWk["startX"] = document.body.scrollLeft || document.documentElement.scrollLeft;
    cmanLinkScrollWk["startY"] = document.body.scrollTop  || document.documentElement.scrollTop;
    cmanLinkScrollWk["endY"]   = Math.floor(document.getElementById(argID).getBoundingClientRect().top);
    cmanLinkScrollWk["endY"]  += cmanLinkScrollWk["startY"];
    cmanLinkScrollWk["moveIdx"] = 0;
    cmanLinkScrollWk["nowY"]    = cmanLinkScrollWk["startY"];
    cmanLinkScrollLoop();
}
function cmanLinkScrollLoop(){
    if (cmanLinkScrollWk["timer"]) {clearTimeout(cmanLinkScrollWk["timer"]);}
    var wParTbl = cmanLinkScrollCns["movePar" + cmanLinkScrollCns["moveWidth"]].split(",");
    var wPar = wParTbl[cmanLinkScrollWk["moveIdx"]];
    cmanLinkScrollWk["moveIdx"]++;
    cmanLinkScrollWk["nowY"]  = Math.floor((cmanLinkScrollWk["endY"] - cmanLinkScrollWk["startY"]) * wPar + cmanLinkScrollWk["startY"]);
    if(cmanLinkScrollWk["moveIdx"] > wParTbl.length){
        clearTimeout(cmanLinkScrollWk["timer"]);   // タイマクリア
    } else {
        window.scrollTo(cmanLinkScrollWk["startX"],cmanLinkScrollWk["nowY"]);   // 移動実行
        cmanLinkScrollWk["timer"] = setTimeout("cmanLinkScrollLoop()",cmanLinkScrollCns["moveTime"]);   // 次のループ
    }
}