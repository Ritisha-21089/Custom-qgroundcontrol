/*=====================================================================

QGroundControl Open Source Ground Control Station

(c) 2009, 2015 QGROUNDCONTROL PROJECT <http://www.qgroundcontrol.org>

This file is part of the QGROUNDCONTROL project

QGROUNDCONTROL is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

QGROUNDCONTROL is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with QGROUNDCONTROL. If not, see <http://www.gnu.org/licenses/>.

======================================================================*/

import QtQuick          2.3
import QtQuick.Controls 1.2
import QtPositioning    5.2

import QGroundControl.Controls      1.0
import QGroundControl.FlightDisplay 1.0
import QGroundControl.ScreenTools   1.0

/// Qml for MainWindow
FlightDisplayView {
    id: _root

    topMargin: toolbarLoader.height

    property var _toolbar: toolbarLoader.item

    readonly property string _planViewSource:   "MissionEditor.qml"
    readonly property string _setupViewSource:  "SetupView.qml"

    Connections {
        target: controller

        onShowFlyView: {
            setupViewLoader.visible = false
            planViewLoader.visible = false
            _root.hideWidgets = false
        }

        onShowPlanView: {
            if (planViewLoader.source != _planViewSource) {
                planViewLoader.source = _planViewSource
            }
            setupViewLoader.visible = false
            planViewLoader.visible = true
            _root.hideWidgets = true
        }

        onShowSetupView: {
            if (setupViewLoader.source != _setupViewSource) {
                setupViewLoader.source = _setupViewSource
            }
            setupViewLoader.visible = true
            planViewLoader.visible = false
            _root.hideWidgets = true
        }

        onShowToolbarMessage: _toolbar.showToolbarMessage(message)

        // The following are use for unit testing only

        onShowSetupFirmware:            setupViewLoader.item.showFirmwarePanel()
        onShowSetupParameters:          setupViewLoader.item.showParametersPanel()
        onShowSetupSummary:             setupViewLoader.item.showSummaryPanel()
        onShowSetupVehicleComponent:    setupViewLoader.item.showVehicleComponentPanel(vehicleComponent)
    }

    // We delay load the following control to improve boot time
    Component.onCompleted: {
        toolbarLoader.source = "MainToolBar.qml"
    }

    Loader {
        id:     toolbarLoader
        width:  parent.width
        height: item ? item.height : 0
        z:      _root.zOrderTopMost
    }

    Loader {
        id:             planViewLoader
        anchors.left:   parent.left
        anchors.right:  parent.right
        anchors.top:    toolbarLoader.bottom
        anchors.bottom: parent.bottom
        visible:        false

        property real zOrder: _root.zOrderTopMost
    }

    Loader {
        id:                 setupViewLoader
        anchors.margins:    ScreenTools.defaultFontPixelWidth
        anchors.left:       parent.left
        anchors.right:      parent.right
        anchors.top:        toolbarLoader.bottom
        anchors.bottom:     parent.bottom
        visible:            false

        property real zOrder: _root.zOrderTopMost
    }
}
