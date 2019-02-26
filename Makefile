PYTHONS = 3.6 3.7

.PHONY: pythons $(PYTHONS)

pythons: $(PYTHONS)

$(PYTHONS):
	docker build --pull --build-arg PYVER=$@ \
		-t pymor/pyqt5:py$@ .

push:
	docker push pymor/pyqt5

run:
	docker run --rm -it pymor/pyqt5:py3.6 bash
all: pythons
