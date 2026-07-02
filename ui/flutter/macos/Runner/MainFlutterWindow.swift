import Cocoa
import FlutterMacOS
import window_manager

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController.init()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()

    styleMask.insert(.fullSizeContentView)
    titleVisibility = .hidden
    titlebarAppearsTransparent = true
    backgroundColor = NSColor(
      calibratedRed: 0.475,
      green: 0.769,
      blue: 0.463,
      alpha: 1.0
    )

    DispatchQueue.main.async {
      self.offsetStandardWindowButtons(x: 5, y: -5)
    }
  }

  private func offsetStandardWindowButtons(x: CGFloat, y: CGFloat) {
    for type in [NSWindow.ButtonType.closeButton, .miniaturizeButton, .zoomButton] {
      guard let button = standardWindowButton(type) else { continue }
      button.frame.origin.x += x
      button.frame.origin.y += y
    }
  }

  override public func order(_ place: NSWindow.OrderingMode, relativeTo otherWin: Int) {
    super.order(place, relativeTo: otherWin)
    hiddenWindowAtLaunch()
  }
}
