//
//  AssemblersContainer.swift
//  PartsFinder
//
//  Created by Dmitry Aksyonov on 05.09.2021.
//

import Foundation

/// Convenience container for holding app's assemblers
/// Made mostly for convenience purposes and `less of code`
struct AssemblersContainer {

	/// Initial application assembler that usually presents launchscreen or something
	let initialSceneAssembler: AssemblyLogic

	/// Main scene assembler
	let mainSceneAssembler: AssemblyLogic
}
