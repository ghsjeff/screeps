var creepWithdraw = require('func.creepWithdraw');

var roleBuilder = {
    
    run: function(creep) {
        
        if (creep.memory.working && creep.carry.energy == 0) {
            creep.memory.working = false;
            creep.say('withdraw');
        }
        
        if (!creep.memory.working && creep.carry.energy == creep.carryCapacity) {
            creep.memory.working = true;
            creep.say('work');
        }
        
        
        if (creep.memory.working) {
            
            var targets = creep.room.find(FIND_CONSTRUCTION_SITES);
//            targets = 0;
            
            if (targets.length) {
                if (creep.build(targets[0]) == ERR_NOT_IN_RANGE) {
                    creep.moveTo(targets[0]);
                } else if (creep.pos.lookFor(LOOK_STRUCTURES)[0]){
                    creep.moveTo(targets[0]);
                }
            } else {
                creep.memory.role = 'repairer';
            }
            
        } else {
            creepWithdraw.run(creep);
        }
    }
}

module.exports = roleBuilder;
