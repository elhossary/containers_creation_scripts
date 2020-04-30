set -e
main(){
	install_prerequisites
	install_htslib
	#install_segemehl_v2
	install_segemehl_v3
	#install_deseq2
	#install_reademption
}
install_prerequisites(){
	apt-get -y install python3 python3-setuptools python3-pip python3-matplotlib cython3 zlib1g-dev	make libncurses5-dev r-base libxml2-dev curl tcl wget
}
install_htslib(){
	wget -c https://github.com/samtools/htslib/releases/download/1.10.2/htslib-1.10.2.tar.bz2
	tar -vxjf htslib-1.10.2.tar.bz2
	cd htslib-1.10.2
	./configure
	make
	make install
	cd ..
}
install_segemehl_v2(){
	curl www.bioinf.uni-leipzig.de/Software/segemehl/old/segemehl_0_2_0.tar.gz > segemehl_0_2_0.tar.gz
	tar xzf segemehl_0_2_0.tar.gz
	cd segemehl_*/segemehl/ && make && cd ../../
	cp segemehl_0_2_0/segemehl/lack.x /usr/bin/lack.x
}
install_segemehl_v3(){
	# Getting lack.x from Segemehl version 2 because it's removed from Segemehl version 3
	curl www.bioinf.uni-leipzig.de/Software/segemehl/old/segemehl_0_2_0.tar.gz > segemehl_0_2_0.tar.gz
	tar xzf segemehl_0_2_0.tar.gz
	cd segemehl_*/segemehl/ && make && cd ../../
	cp segemehl_0_2_0/segemehl/lack.x /usr/bin/lack.x
	
	# Now install version 3
	curl https://www.bioinf.uni-leipzig.de/Software/segemehl/downloads/segemehl-0.3.4.tar.gz > segemehl-0.3.4.tar.gz
	tar xzf segemehl-0.3.4.tar.gz
	cd segemehl-0.3.4/
	make all
	cp *.x /usr/bin/
	cd ..
}
install_deseq2(){
	Rscript -e 'if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")' -e 'BiocManager::install(c("DESeq2"))'
}
install_reademption(){
	pip3 install READemption
}
main