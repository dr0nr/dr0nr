

TARGETS := brn rec

mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))
full_path := $(dir $(mkfile_path))

export ARDUINO=/Applications/Arduino.app/Contents/MacOS/Arduino
export ARDUINO_BUILDER=/Applications/Arduino.app/Contents/Java/arduino-builder

export LIBRARIES := -libraries $(full_path)lib
export full_path

define make-target
  	all:: ; @echo " - Building $1" && mkdir -p $(full_path)build/$1 && make BUILD_PATH=$(full_path)build/$1 -C $1
endef
$(foreach single_target,$(TARGETS),$(eval $(call make-target,$(single_target))))

update:
	@echo "Updating..."
	@git submodule update
	@#@@@@@@@
	
clean:
	@echo "Cleaning..."
	@rm -rf build/*