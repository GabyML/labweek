describe('Thermostat Logic', function(){

	var thermostat;

	beforeEach(function() {
		thermostat = new Thermostat();
		temperature = thermostat.degrees
	});
	
	describe('Starting State', function(){

		it('has a starting default temperature of 20 degrees', function(){
			expect(thermostat.degrees).toEqual(thermostat.degreesStarting);
		});

		it('starts with Power Saving Mode On', function(){
			expect(thermostat.PowerSavingMode).toBe(true);
		});
	});

	describe('Power Saving Mode', function(){

		it('can turn off the Power Saving Mode', function(){
			thermostat.PowerSavingMode = true
			thermostat.SwitchPowerSavingMode()
			expect(thermostat.PowerSavingMode).toBe(false)
		});

		it('can change status when Power Saving Mode is turned off', function(){
			thermostat.PowerSavingMode = true
			thermostat.SwitchPowerSavingMode()
			expect(thermostat.psmStatus).toEqual('Power Saving Mode OFF')
		});

		it('can turn on the Power Saving Mode', function(){
			thermostat.PowerSavingMode = false
			thermostat.SwitchPowerSavingMode()
			expect(thermostat.PowerSavingMode).toBe(true)
		});

		it('can change status when Power Saving Mode is turned on', function(){
			thermostat.PowerSavingMode = false
			thermostat.SwitchPowerSavingMode()
			expect(thermostat.psmStatus).toEqual('Power Saving Mode ON')
		});


	});

	describe('Change temperature', function(){

		it('can increase the temperature', function(){
			thermostat.increase()
			expect(thermostat.degrees).toEqual(temperature + 1)
		});

		it('can decrease the temperature', function(){
			thermostat.decrease()
			expect(thermostat.degrees).toEqual(temperature - 1)
		});
	});

	describe('Minimum temperature', function(){

		it('has a minimum temperature of 10 degrees', function(){
			thermostat.degrees = thermostat.MinTemperature
			thermostat.decrease
			expect(thermostat.degrees).toEqual(thermostat.MinTemperature)
		});
	});

	describe('Maximum tempearture', function(){

		it('has a maximum temperature', function(){
			thermostat.degrees = thermostat.MaxTemperature
			thermostat.increase()
			expect(thermostat.degrees).toEqual(thermostat.MaxTemperature)
		});

		it('has a maximum temperature of 25 if Power Saving Mode is on', function(){
			thermostat.PowerSavingMode = true
			thermostat.maximum()
			expect(thermostat.MaxTemperature).toEqual(thermostat.MaxPSMOn)
		});

		it('has a maximum temperature of 32 if Power Saving Mode is off', function(){
			thermostat.PowerSavingMode = false
			thermostat.maximum()
			expect(thermostat.MaxTemperature).toEqual(thermostat.MaxPSMOff)
		});

		it('sets temperature to 25 if Power Saving Mode is turned On and temperature is above 25', function(){
			thermostat.degrees = 30
			thermostat.PowerSavingMode = true
			thermostat.checkMaximum()
			expect(thermostat.degrees).toEqual(thermostat.MaxPSMOn)
		});
	});

	describe('Reset button', function(){

		it('goes to 20 after calling reset', function(){
			thermostat.resetButton()
			expect(temperature).toEqual(thermostat.resetTemperature)
		});
	});

	describe('Color code',function(){

		it('is green when temperature is - < 18', function(){
			thermostat.degrees = 13
			thermostat.colorControl()
			expect(thermostat.colorCode).toMatch('green')
		});

		it('is green when temperature is from 19 to 24', function(){
			thermostat.degrees = 23
			thermostat.colorControl()
			expect(thermostat.colorCode).toMatch('yellow')
		});

		it('is green when temperature is > 24', function(){
			thermostat.degrees = 25
			thermostat.colorControl()
			expect(thermostat.colorCode).toMatch('red')
		});

	});
});