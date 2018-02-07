PYTHONS = 3.5 3.6 3.7-rc

.PHONY: pythons $(PYTHONS)

pythons: $(PYTHONS)

$(PYTHONS):
	docker build --build-arg PYVER=$@ \
		-t pymor/pyqt5:py$@ .

push:
	docker push pymor/pyqt5

run:
	docker run --rm -it pymor/pyqt5:py3.5 bash
all: pythons
