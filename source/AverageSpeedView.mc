using Toybox.WatchUi;

class AverageSpeedView extends WatchUi.SimpleDataField {

	hidden var _unitsSetting;

    // Set the label of the data field here.
    function initialize() {
        SimpleDataField.initialize();
         // units
        var settings = System.getDeviceSettings();
        _unitsSetting = settings.distanceUnits;
        label = "Avg. Speed";
    }

    // The given info object contains all the current workout
    // information. Calculate a value and return it in this method.
    // Note that compute() and onUpdate() are asynchronous, and there is no
    // guarantee that compute() will be called before onUpdate().
    function compute(info) {
        // See Activity.Info in the documentation for available information.
        var averageRaw = info.averageSpeed;
    	var average;
 	    if (System.UNIT_METRIC == _unitsSetting) {
	    	average = speedMetric(averageRaw);
	    } else {
	    	average = speedStatute(averageRaw);
	    }
	    return average;
    }

	function speedMetric(speed) {
		if (null == speed) {
			return null;
		}
        return speed * 3600 / 1000;
	}
	
	function speedStatute(speed) {
		if (null == speed) {
			return null;
		}
		return speed * 3600 / 1609.3;
	}
}