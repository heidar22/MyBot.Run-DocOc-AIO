;MODded by DocOc++ Team AIO

; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........:
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Global $txtPresetSaveFilename, $txtSavePresetMessage, $lblLoadPresetMessage,$btnGUIPresetDeleteConf, $chkCheckDeleteConf
Global $cmbPresetList, $txtPresetMessage,$btnGUIPresetLoadConf,  $lblLoadPresetMessage,$btnGUIPresetDeleteConf, $chkCheckDeleteConf

;$hGUI_Profiles = GUICreate("", $_GUI_MAIN_WIDTH - 28, $_GUI_MAIN_HEIGHT - 255 - 28, 5, 25, BitOR($WS_CHILD, $WS_TABSTOP), -1, $hGUI_BOT)
;GUISwitch($hGUI_Profiles)

Local $x = 25, $y = 45
	$grpProfiles = GUICtrlCreateGroup(GetTranslated(637,1, "Switch Profiles"), $x - 20, $y - 20, 440, 360)
		;$y -= 5
		$x -= 5
		;$lblProfile = GUICtrlCreateLabel(GetTranslated(7,27, "Current Profile") & ":", $x, $y, -1, -1)
		;$y += 15
		$cmbProfile = GUICtrlCreateCombo("", $x - 3, $y + 1, 130, 18, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = GetTranslated(637,2, "Use this to switch to a different profile")& @CRLF & GetTranslated(637,3, "Your profiles can be found in") & ": " & @CRLF & $sProfilePath
			_GUICtrlSetTip(-1, $txtTip)
			setupProfileComboBox()
			PopulatePresetComboBox()
			GUICtrlSetState(-1, $GUI_SHOW)
			GUICtrlSetOnEvent(-1, "cmbProfile")
		$txtVillageName = GUICtrlCreateInput(GetTranslated(637,4, "MyVillage"), $x - 3, $y, 130, 22, $ES_AUTOHSCROLL)
			GUICtrlSetLimit (-1, 100, 0)
			GUICtrlSetFont(-1, 9, 400, 1)
			_GUICtrlSetTip(-1, GetTranslated(637,5, "Your village/profile's name"))
			GUICtrlSetState(-1, $GUI_HIDE)
			; GUICtrlSetOnEvent(-1, "txtVillageName") - No longer needed

		$bIconAdd = _GUIImageList_Create(24, 24, 4)
			_GUIImageList_AddBitmap($bIconAdd, @ScriptDir & "\images\Button\iconAdd.bmp")
			_GUIImageList_AddBitmap($bIconAdd, @ScriptDir & "\images\Button\iconAdd_2.bmp")
			_GUIImageList_AddBitmap($bIconAdd, @ScriptDir & "\images\Button\iconAdd_2.bmp")
			_GUIImageList_AddBitmap($bIconAdd, @ScriptDir & "\images\Button\iconAdd_4.bmp")
			_GUIImageList_AddBitmap($bIconAdd, @ScriptDir & "\images\Button\iconAdd.bmp")
		$bIconConfirm = _GUIImageList_Create(24, 24, 4)
			_GUIImageList_AddBitmap($bIconConfirm, @ScriptDir & "\images\Button\iconConfirm.bmp")
			_GUIImageList_AddBitmap($bIconConfirm, @ScriptDir & "\images\Button\iconConfirm_2.bmp")
			_GUIImageList_AddBitmap($bIconConfirm, @ScriptDir & "\images\Button\iconConfirm_2.bmp")
			_GUIImageList_AddBitmap($bIconConfirm, @ScriptDir & "\images\Button\iconConfirm_4.bmp")
			_GUIImageList_AddBitmap($bIconConfirm, @ScriptDir & "\images\Button\iconConfirm.bmp")
		$bIconDelete = _GUIImageList_Create(24, 24, 4)
			_GUIImageList_AddBitmap($bIconDelete, @ScriptDir & "\images\Button\iconDelete.bmp")
			_GUIImageList_AddBitmap($bIconDelete, @ScriptDir & "\images\Button\iconDelete_2.bmp")
			_GUIImageList_AddBitmap($bIconDelete, @ScriptDir & "\images\Button\iconDelete_2.bmp")
			_GUIImageList_AddBitmap($bIconDelete, @ScriptDir & "\images\Button\iconDelete_4.bmp")
			_GUIImageList_AddBitmap($bIconDelete, @ScriptDir & "\images\Button\iconDelete.bmp")
		$bIconCancel = _GUIImageList_Create(24, 24, 4)
			_GUIImageList_AddBitmap($bIconCancel, @ScriptDir & "\images\Button\iconCancel.bmp")
			_GUIImageList_AddBitmap($bIconCancel, @ScriptDir & "\images\Button\iconCancel_2.bmp")
			_GUIImageList_AddBitmap($bIconCancel, @ScriptDir & "\images\Button\iconCancel_2.bmp")
			_GUIImageList_AddBitmap($bIconCancel, @ScriptDir & "\images\Button\iconCancel_4.bmp")
			_GUIImageList_AddBitmap($bIconCancel, @ScriptDir & "\images\Button\iconCancel.bmp")
		$bIconEdit = _GUIImageList_Create(24, 24, 4)
			_GUIImageList_AddBitmap($bIconEdit, @ScriptDir & "\images\Button\iconEdit.bmp")
			_GUIImageList_AddBitmap($bIconEdit, @ScriptDir & "\images\Button\iconEdit_2.bmp")
			_GUIImageList_AddBitmap($bIconEdit, @ScriptDir & "\images\Button\iconEdit_2.bmp")
			_GUIImageList_AddBitmap($bIconEdit, @ScriptDir & "\images\Button\iconEdit_4.bmp")
			_GUIImageList_AddBitmap($bIconEdit, @ScriptDir & "\images\Button\iconEdit.bmp")
		; IceCube (Misc v1.0)
		$bIconRecycle = _GUIImageList_Create(24, 24, 4)
			_GUIImageList_AddBitmap($bIconRecycle, @ScriptDir & "\images\Button\iconRecycle.bmp")
			_GUIImageList_AddBitmap($bIconRecycle, @ScriptDir & "\images\Button\iconRecycle_2.bmp")
			_GUIImageList_AddBitmap($bIconRecycle, @ScriptDir & "\images\Button\iconRecycle_2.bmp")
			_GUIImageList_AddBitmap($bIconRecycle, @ScriptDir & "\images\Button\iconRecycle_4.bmp")
			_GUIImageList_AddBitmap($bIconRecycle, @ScriptDir & "\images\Button\iconRecycle.bmp")
		; IceCube (Misc v1.0)

		$btnAdd = GUICtrlCreateButton("", $x + 135, $y, 24, 24)
			_GUICtrlButton_SetImageList($btnAdd, $bIconAdd, 4)
			GUICtrlSetOnEvent(-1, "btnAddConfirm")
			GUICtrlSetState(-1, $GUI_SHOW)
			_GUICtrlSetTip(-1, GetTranslated(637,6, "Add New Profile"))
		$btnConfirmAdd = GUICtrlCreateButton("", $x + 135, $y, 24, 24)
			_GUICtrlButton_SetImageList($btnConfirmAdd, $bIconConfirm, 4)
			GUICtrlSetOnEvent(-1, "btnAddConfirm")
			GUICtrlSetState(-1, $GUI_HIDE)
			_GUICtrlSetTip(-1, GetTranslated(637,7, "Confirm"))
		$btnConfirmRename = GUICtrlCreateButton("", $x + 135, $y, 24, 24)
			_GUICtrlButton_SetImageList($btnConfirmRename, $bIconConfirm, 4)
			GUICtrlSetOnEvent(-1, "btnRenameConfirm")
			GUICtrlSetState(-1, $GUI_HIDE)
			_GUICtrlSetTip(-1, GetTranslated(637,7, -1))
		$btnDelete = GUICtrlCreateButton("", $x + 164, $y, 24, 24)
			_GUICtrlButton_SetImageList($btnDelete, $bIconDelete, 4)
			GUICtrlSetOnEvent(-1, "btnDeleteCancel")
			GUICtrlSetState(-1, $GUI_SHOW)
			_GUICtrlSetTip(-1, GetTranslated(637,8, "Delete Profile"))
		$btnCancel = GUICtrlCreateButton("", $x + 164, $y, 24, 24)
			_GUICtrlButton_SetImageList($btnCancel, $bIconCancel, 4)
			GUICtrlSetOnEvent(-1, "btnDeleteCancel")
			GUICtrlSetState(-1, $GUI_HIDE)
			_GUICtrlSetTip(-1, GetTranslated(637,9, "Cancel"))
		$btnRename = GUICtrlCreateButton("", $x + 194, $y, 24, 24)
			_GUICtrlButton_SetImageList($btnRename, $bIconEdit, 4)
			GUICtrlSetOnEvent(-1, "btnRenameConfirm")
			_GUICtrlSetTip(-1, GetTranslated(637,10, "Rename Profile"))
		; IceCube (Misc v1.0)
		$btnRecycle = GUICtrlCreateButton("", $x + 223, $y + 2, 22, 22)
			_GUICtrlButton_SetImageList($btnRecycle, $bIconRecycle, 4)
			GUICtrlSetOnEvent(-1, "btnRecycle")
			GUICtrlSetState(-1, $GUI_SHOW)
			_GUICtrlSetTip(-1, GetTranslated(655,12, "Recycle Profile by removing all settings no longer suported that could lead to bad behaviour"))
			If GUICtrlRead($cmbProfile) = "<No Profiles>" Then
				GUICtrlSetState(-1, $GUI_DISABLE)
			Else
				GUICtrlSetState(-1, $GUI_ENABLE)
			EndIf
		; IceCube (Misc v1.0)

	GUICtrlCreateGroup("", -99, -99, 1, 1)

Local $x = 10, $z = 189, $w = 357, $y = 85

	GUICtrlCreateGroup(GetTranslated(108,1, "Smart Switch Accounts"), $x, $y, 430, 295)

		$x += 10
		$y += 20

			$chkEnableSwitchAccount = GUICtrlCreateCheckbox(GetTranslated(108,2, "Use Smart Switch Accounts"), $x, $y, 152, 17)
				GUICtrlSetOnEvent(-1, "chkSwitchAccount")

			$lblNB = GUICtrlCreateLabel(GetTranslated(108,3, "Number of accounts on Emulator :"), $x + 195, $y + 2, 165, 17)
			$cmbAccountsQuantity = GUICtrlCreateCombo("", $x + 365, $y - 2, 45, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
				GUICtrlSetOnEvent(-1, "cmbAccountsQuantity")
				GUICtrlSetData(-1, "2|3|4|5|6|7|8", "2")

		$y += 35

			$chkCanUse[1] = GUICtrlCreateCheckbox(GetTranslated(108,4, "Use Account 1 with Profile :"), $x, $y, 150, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")
			$cmbAccount[1] = GUICtrlCreateCombo("", $z, $y - 2, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
			$chkDonateAccount[1] = GUICtrlCreateCheckbox(GetTranslated(108,5, "Donate only"), $w, $y, 77, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")

		$y += 30

			$chkCanUse[2] = GUICtrlCreateCheckbox(GetTranslated(108,6, "Use Account 2 with Profile :"), $x, $y, 150, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")
			$cmbAccount[2] = GUICtrlCreateCombo("", $z, $y - 2, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
			$chkDonateAccount[2] = GUICtrlCreateCheckbox(GetTranslated(108,5, "Donate only"), $w, $y, 77, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")

		$y += 30

			$chkCanUse[3] = GUICtrlCreateCheckbox(GetTranslated(108,7, "Use Account 3 with Profile :"), $x, $y, 150, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")
			$cmbAccount[3] = GUICtrlCreateCombo("", $z, $y - 2, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
			$chkDonateAccount[3] = GUICtrlCreateCheckbox(GetTranslated(108,5, "Donate only"), $w, $y, 77, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")

		$y += 30

			$chkCanUse[4] = GUICtrlCreateCheckbox(GetTranslated(108,8, "Use Account 4 with Profile :"), $x, $y, 150, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")
			$cmbAccount[4] = GUICtrlCreateCombo("", $z, $y - 2, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
			$chkDonateAccount[4] = GUICtrlCreateCheckbox(GetTranslated(108,5, "Donate only"), $w, $y, 77, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")

		$y += 30

			$chkCanUse[5] = GUICtrlCreateCheckbox(GetTranslated(108,9, "Use Account 5 with Profile :"), $x, $y, 150, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")
			$cmbAccount[5] = GUICtrlCreateCombo("", $z, $y - 2, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
			$chkDonateAccount[5] = GUICtrlCreateCheckbox(GetTranslated(108,5, "Donate only"), $w, $y, 77, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")

		$y += 30

			$chkCanUse[6] = GUICtrlCreateCheckbox(GetTranslated(108,10, "Use Account 6 with Profile :"), $x, $y, 150, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")
			$cmbAccount[6] = GUICtrlCreateCombo("", $z, $y - 2, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
			$chkDonateAccount[6] = GUICtrlCreateCheckbox(GetTranslated(108,5, "Donate only"), $w, $y, 77, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")

		$y += 30

			$chkCanUse[7] = GUICtrlCreateCheckbox(GetTranslated(108,11, "Use Account 7 with Profile :"), $x, $y, 150, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")
			$cmbAccount[7] = GUICtrlCreateCombo("", $z, $y - 2, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
			$chkDonateAccount[7] = GUICtrlCreateCheckbox(GetTranslated(108,5, "Donate only"), $w, $y, 77, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")

		$y += 30

			$chkCanUse[8] = GUICtrlCreateCheckbox(GetTranslated(108,12, "Use Account 8 with Profile :"), $x, $y, 150, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")
			$cmbAccount[8] = GUICtrlCreateCombo("", $z, $y - 2, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
			$chkDonateAccount[8] = GUICtrlCreateCheckbox(GetTranslated(108,5, "Donate only"), $w, $y, 77, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")

		GUICtrlCreateGroup("", -99, -99, 1, 1)

	GUICtrlCreateGroup("", -99, -99, 1, 1)
;GUISetState()
