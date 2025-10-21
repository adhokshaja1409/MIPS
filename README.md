# MIPS
Place and Route of MIPS single instruction per cycle 32-bit processor

This repository contains MIPS processor design.

start tool:	synthesis:
			genus 
		PNR:
			innovus -stylus
			
steps to run flows for mips:
		synthesis:
			source genus_mips.tcl
		PNR:
			source innov_stylus.tcl
