

fetch('https://raw.githubusercontent.com/jmcg0192/project3/main/data.json')
.then(function(resp){
    return resp.json();
})
.then(function(data){
   parentFunction(data);
});

function parentFunction(jsondata){
    let mouseX = 0;
    
    let buttonTracker = [];
    let rootNode = d3.hierarchy(jsondata, d=>d.children);
    var pathLinks = rootNode.links(); 
    var updatePathLinks;
    rootNode.descendants()[0].data.value = 50;

    var circleLinks = rootNode.descendants();
    var updateCircleLinks;

    var textLinks = rootNode.descendants();
    var updateTextLinks;

    let dim = {
        'width': window.screen.width - 115, 
        'height':window.screen.height - 100   , 
        'margin':50   
    };

    let svg = d3.select('#chart').append('svg')
        .style('background', 'white')   
        .attrs(dim);

    document.querySelector("#chart").classList.add("center");

    let g = svg.append('g')
                .attr('transform', 'translate(140,50)');

        let layout = d3.tree().size([dim.height-50, dim.width-320]);

        layout(rootNode);
    let lines = g.selectAll('path');  

    function update(data){

    let group =  g.selectAll('path')
        .data(data, (d,i) => d.target.data.name)
        .join(
        function(enter){
            return enter.append('path')
                        .attrs({
                            'd': d3.linkHorizontal()
                            .x(d => mouseX)
                            .y(d => d.x),
                        'fill':'none',
                        'stroke':'purple',
                        // determine stroke width based on 'value' attribute from data
                        'stroke-width': d => d.target.data.value*1.05,
                        })
        },
        function(update){
            return update;
        },
        function(exit){
            return exit.call(path => path.transition().duration(300).remove()
                                                    .attr('d', d3.linkHorizontal()
                                                                .x(d => mouseX)
                                                                .y(d =>d.x)));
        }
    )
    .call(path => path.transition().duration(1000).attr('d', d3.linkHorizontal()
            .x(d => d.y)
            .y(d => d.x))
            .attr("id", function(d,i){return "path"+i}));
    }
    update(pathLinks);

    function updateCircles(data){
        g.selectAll('circle')
        .data(data, (d) => d.data.name)
        .join(
            function(enter){
                return enter.append('circle')
                            .attrs({
                                'cx':(d)=> mouseX,
                                'cy':(d) => d.x,
                                'r':(d) => d.data.value*1.4,
                                'fill':(d) => {
                                    return 'orange'
                                },
                                'id': (d,i) =>d.data.name,
                                'class':'sel'                           
                            })
            },
            function(update){
                return update;
            },
            function(exit){

                return exit.call(path => path.transition().duration(300).remove()
                .attrs({
                    'cx':(d) =>mouseX,
                    'r':(d) => 0
                }));
            }
        )
        .call(circle => circle.transition().duration(1000).attr('cx', (d)=>d.y))
        .on('mouseover', function(d){

        d3.select(this)
            .attrs({                
                'fill':'green',
            })
            .append('title')
            .text((d) => d.data.value)
        })
        .on('mouseout', function(d){
        d3.select(this)
            .attr('fill', 'orange')
        })
        .on('click', async function(d){

            let buttonId = d3.select(this)["_groups"][0][0]["attributes"].id.value;
            mouseX = d3.select(this)["_groups"][0][0]["attributes"].cx.value;

            //check button click
            let checkButtonExists = buttonTracker.filter(button => button.buttonId == buttonId);
    
            if(checkButtonExists[0]!=undefined){

                buttonTracker = buttonTracker.filter(button => button.buttonId != buttonId);
                
                pathLinks = checkButtonExists[0].buttonPathData.concat(pathLinks);
                                
                update(pathLinks);

                circleLinks = checkButtonExists[0].buttonCircleData.concat(circleLinks);
                    updateCircles(circleLinks);

                    textLinks =checkButtonExists[0].buttonTextData.concat(textLinks);
                    updateText(textLinks);

                    return;

            }

            var valueArray = await processedlinks(d.links());   

            updatePathLinks = pathLinks.filter(function(item){        
                    return !valueArray.includes(item.target.data.name);                                       
            });

            var clickedPathData = pathLinks.filter(function(item){
                return valueArray.includes(item.target.data.name);
                });

            updateCircleLinks = circleLinks.filter(function(item){
                        return !valueArray.includes(item.data.name);
            });

            var clickedCircleData = circleLinks.filter(function(item){
                        return valueArray.includes(item.data.name);
            });
        
            updateTextLinks = textLinks.filter(function(item){
                        return !valueArray.includes(item.data.name);
            });

            var clickedTextData = textLinks.filter(function(item){
                        return valueArray.includes(item.data.name);
            });

            buttonTracker.push({
                buttonId:buttonId,
                buttonPathData: clickedPathData,
                buttonCircleData:clickedCircleData,
                buttonTextData:clickedTextData
            })

            updateCircles(updateCircleLinks);
            update(updatePathLinks);
            updateText(updateTextLinks);
            async function processedlinks(dlinks) {
            var valueArray = [];
        
                return new Promise((resolve, reject)=>{
                        dlinks.forEach(async(element) =>{
                            valueArray.push(element.target.data.name); 
                        });
                        resolve(valueArray);      
                });
            }

            circleLinks = updateCircleLinks;
            pathLinks = updatePathLinks;
            textLinks = updateTextLinks;

        });


    }

    updateCircles(rootNode.descendants());

    function updateText(data){

        g.selectAll('text')
        .data(data, (d) =>d.data.name)
        .join(
            function(enter){
                //if the node is a leaf node, dont display value
                return enter.append('text')
                            .attrs({
                                'x':(d)=> mouseX+35,
                                'y':(d) => d.x+25,
                                'font-size':0,
                                'fill':'darkred',
                                'id': (d,i) =>d.data.name,
                                'class':'sel'
                            })
                            .text((d) => {
                                if(d.children == undefined){
                                    return d.data.name;
                                }
                                else{
                                    return d.data.name.concat(" : ").concat(d.data.value).concat(" total interactions");
                                }
                            })
            },
            function(update){
                return update;
            },
            function(exit){
                    return exit.call(text => text.transition().duration(300).remove().attrs({
                        'x':(d) => mouseX,
                        'font-size':0 
                    }));   
            }

        )
        .call(text => text.transition().duration(1000).attrs({
            'x':(d) =>d.y-90,
            'y':(d) => d.x+25,
            'font-size':12,
            'fill':'darkred',
            }));
    }
    updateText(textLinks);
    
}