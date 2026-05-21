# qcTAF 2026.05.22

* Renamed function qc.relative.paths() to qc.only.relative.paths().

* Changed function qc.only.relative.paths() to identify /home/ as absolute path.




# qcTAF 2026.02.21

* Added functions qc.data.declared(), qc.software.declared(), and
  qc.initial.data().

* Renamed function qc.data.bib.entries() to qc.data.bib.processed() and
  qc.software.bib.entries() to qc.software.bib.processed().

* Added two new TAF complete criteria: identical files in initial data and boot
  data, files in boot/data must be declared in DATA.bib.




# qcTAF 2026.02.13

* Added functions qc.relative.paths() and qc.scripts.exist().




# qcTAF 2026.02.06

* Initial release, with eight functions: qc(), qc.boot.exists(),
  qc.data.bib.exists(), qc.data.bib.valid(), qc.data.bib.entries(),
  qc.software.bib.exists(), qc.software.bib.valid(), and
  qc.software.bib.entries().

* README.md lists ten criteria that characterize TAF complete analyses.
