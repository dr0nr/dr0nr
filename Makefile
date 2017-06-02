
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))
full_path := $(dir $(mkfile_path))


BUILD_PATH = $(full_path)build

export LIBRARIES := -libraries $(full_path)lib
export BUILD_PATH
export full_path

all:
	@mkdir -p $(BUILD_PATH)
	@#make update
	@echo "Building..."
	@make -C brn/

update:
	@echo "Updating..."
	@git submodule update
	@#@@@@@@@
clean:
	@echo "Cleaning..."
	@rm -rf build/*