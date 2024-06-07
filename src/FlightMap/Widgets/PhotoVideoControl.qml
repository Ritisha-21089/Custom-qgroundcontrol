

/****************************************************************************
 *
 * (c) 9-2020 QGROUNDCONTROL PROJECT <http://www.qgroundcontrol.org>
 *
 * QGroundControl is licensed according to the terms in the file
 * COPYING.md in the root of the source code directory.
 *
 ****************************************************************************/

import QtQuick                  2.4
import QtPositioning            5.2
import QtQuick.Layouts          1.2
import QtQuick.Controls         1.4
import QtQuick.Dialogs          1.2
import QtGraphicalEffects       1.0

import QGroundControl                   1.0
import QGroundControl.ScreenTools       1.0
import QGroundControl.Controls          1.0
import QGroundControl.Palette           1.0
import QGroundControl.Vehicle           1.0
import QGroundControl.Controllers       1.0
import QGroundControl.FactSystem        1.0
import QGroundControl.FactControls      1.0

Rectangle {
    // Removed the height and color settings as they were specific to the removed camera component
    visible: false  // Set visibility to false as the component is removed

    // Removed properties specific to the removed camera component

    QGCPalette { id: qgcPal; colorGroupEnabled: enabled }

    // Removed the QGCColoredImage block and other camera-related items

    // ColumnLayout is kept empty
    ColumnLayout {
        id: mainLayout
        anchors.margins: ScreenTools.defaultFontPixelHeight / 2
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: ScreenTools.defaultFontPixelHeight / 2

        // All camera-related UI elements have been removed
    }

    // Removed the settingsDialogComponent as it was specific to the removed camera component
}
