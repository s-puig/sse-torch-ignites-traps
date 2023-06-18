Scriptname TBIT_PlayerBash extends ReferenceAlias  

Spell Property TBIT_BashSpell AUTO

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	if akBaseObject as Light && self.GetActorReference().GetEquippedItemType(0) == 11
		RegisterForAnimationEvent(self.GetReference(), "bashStop")
	endIf
endEvent

Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
	if akBaseObject as Light && self.GetActorReference().GetEquippedItemType(0) != 11
		UnregisterForAnimationEvent(self.GetReference(), "bashStop")
	endIf
endEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	if (akSource == self.GetActorReference()) && (asEventName ==  "bashStop")
		TBIT_BashSpell.Cast(self.GetActorReference())
	endIf
endEvent