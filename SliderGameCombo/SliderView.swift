//
//  SliderView.swift
//  SliderGameCombo
//
//  Created by Sergey Efimov on 11.01.2022.
//

import SwiftUI

struct SliderView: UIViewRepresentable {
    
    @Binding var value: Double
    
    let opacity: Int
    let color: UIColor
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        
        slider.minimumValue = 1
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ view: UISlider, context: Context) {
        view.thumbTintColor = color.withAlphaComponent(CGFloat(opacity) / 100)
        view.value = Float(value)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension SliderView {
    class Coordinator: NSObject {
        
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct CustomSlider_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(value: .constant(20), opacity: 70, color: .blue)
    }
}
