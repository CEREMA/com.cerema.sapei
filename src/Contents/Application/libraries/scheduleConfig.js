// define time axis & presets

Ext.define('Lib.scheduleConfig.timeAxis', {
    extend     : "Ext.ux.Scheduler.data.TimeAxis",
    continuous : false,

    generateTicks : function (start, end, unit, increment) {
        // Use our own custom time intervals for day time-axis
        if (unit === Ext.ux.Scheduler.util.Date.DAY) {
            var ticks = [],
                intervalEnd;

            while (start < end) {
                if (start.getDay() === 5) {
                    // Fridays are lazy days, working 10am - 4pm
                    start.setHours(8);
                    intervalEnd = Ext.ux.Scheduler.util.Date.add(start, Ext.ux.Scheduler.util.Date.HOUR, 10);
                } else {
                    start.setHours(8);
                    intervalEnd = Ext.ux.Scheduler.util.Date.add(start, Ext.ux.Scheduler.util.Date.HOUR, 10);
                }

                ticks.push({
                    start : start,
                    end   : intervalEnd
                });
                start = Ext.ux.Scheduler.util.Date.add(start, Ext.ux.Scheduler.util.Date.DAY, 1);
            }
            return ticks;
        } else {
            return this.callParent(arguments);
        }
    }
});

Ext.ux.Scheduler.preset.Manager.registerPreset("CEREMA_VIEW", {
        displayDateFormat : 'd/m/Y',
        shiftIncrement    : 1,
        shiftUnit         : "WEEK",
        timeColumnWidth   : 90,
        timeResolution    : {
            unit      : "HOUR",
            increment : 1
        },
        headerConfig      : {
            middle : {
                unit     : "DAY",
                align    : 'center',
                renderer : function (start, end, cfg) {
                    return start.getDayName()+' '+start.getDate();
                }
            },
            top    : {
                unit     : "WEEK",
                align    : 'center',
                renderer : function (start, end, cfg) {
                    return Ext.Date.format(start, 'M Y')+' - Semaine ' + Ext.Date.format(start, 'W');
                }
            }
        }
}); 	
