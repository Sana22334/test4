//
//  test4App.swift
//  test4
//
//  Created by saNa on 16/06/1446 AH.
//

import UIKit
import AVFoundation

class TextEditorViewController: UIViewController {
    // النص
    let textView: UITextView = {
        let tv = UITextView()
        tv.text = "هذا النص بمثابة نص يظهر للمستخدم هذا النص بمثابة نص يظهر للمستخدم..."
        tv.font = UIFont.systemFont(ofSize: 18)
        tv.textAlignment = .right
        tv.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.2)
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    // زر قراءة النص
    let readTextButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "speaker.wave.2.fill")
        button.setImage(image, for: .normal)
        button.tintColor = .systemBlue
        button.backgroundColor = .white
        button.layer.cornerRadius = 20 // نصف القطر للدائرة
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // زر الرجوع
    let backButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "chevron.backward")
        button.setImage(image, for: .normal)
        button.tintColor = .systemBlue
        button.backgroundColor = .white
        button.layer.cornerRadius = 20 // نصف القطر للدائرة
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let speechSynthesizer = AVSpeechSynthesizer()
    var isMuted = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // إضافة العناصر
        view.addSubview(textView)
        view.addSubview(readTextButton)
        view.addSubview(backButton)

        setupConstraints()

        // إضافة الأحداث
        readTextButton.addTarget(self, action: #selector(toggleSound), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            // إعداد constraints للنص
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),

            // إعداد constraints لزر القراءة (يمين)
            readTextButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            readTextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            readTextButton.heightAnchor.constraint(equalToConstant: 40),
            readTextButton.widthAnchor.constraint(equalToConstant: 40),

            // إعداد constraints لزر الرجوع (يسار)
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            backButton.widthAnchor.constraint(equalToConstant: 40)
        ])
    }

    @objc func toggleSound() {
        if isMuted {
            isMuted = false
            readTextButton.setImage(UIImage(systemName: "speaker.wave.2.fill"), for: .normal)
            readTextAloud()
        } else {
            isMuted = true
            readTextButton.setImage(UIImage(systemName: "speaker.slash.fill"), for: .normal)
            speechSynthesizer.stopSpeaking(at: .immediate)
        }
    }

    func readTextAloud() {
        guard let text = textView.text, !text.isEmpty else { return }
        let speechUtterance = AVSpeechUtterance(string: text)
        speechUtterance.rate = AVSpeechUtteranceDefaultSpeechRate
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "ar-SA")
        speechSynthesizer.speak(speechUtterance)
    }

    @objc func goBack() {
        dismiss(animated: true, completion: nil)
    }
}
