describe('Thermostat Features',function(){
	// var thermostat = new Thermostat();
  // setup test server - localhost9292
  beforeEach(function() {
    jasmine.getFixtures().fixturesPath = ".";
    loadFixtures("Thermostat.html");
    $.holdReady(false);
  });

  it('displays default temperature', function(){
    expect('.temperature').toContainText(20);
  });

  it('should increase the temperature when pressing +', function(){
  	$("button[data-temp-control='up']").click();
  	expect('.temperature').toContainText(21);
  });

  it('should decrease the temperature when pressing -', function(){
  	$("button[data-temp-control='down']").click();
  	expect('.temperature').toContainText(19);
  });

  it('should go back to starting temperature of 20 after pressing reset', function(){
  	$("button[data-temp-control='up']").click();
  	$("button[data-temp-reset='reset']").click();
  	expect('.temperature').toContainText(20);
  });

  it('should change the maximum limit when Power Saving Mode is off', function(){
  	$("input:checkbox").change();
      for (var i = 0; i < 6; i++) {
        $("button[data-temp-control='up']").click(); }
      expect("span").toContainText("26");
  });

});