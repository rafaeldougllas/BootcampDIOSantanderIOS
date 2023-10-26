//
//  AnimeDetailViewController.swift
//  AnimesDiscovery
//
//  Created by rafael douglas on 24/10/23.
//

import SnapKit
import UIKit

class AnimeDetailViewController: UIViewController {
    
    let viewMode: AnimeDetailViewModel
    
    init(viewMode: AnimeDetailViewModel) {
        self.viewMode = viewMode
        super.init(nibName: nil, bundle: nil)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewMode.fetchAnimeBy { [weak self] in
            guard let self = self else { return }
            self.setInfoData()
        }
    }
    
    // MARK: UI
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    // MARK: Methods
    private func setInfoData() {
        guard let model = viewMode.model else { return }
        posterImageView.loadImage(url: model.images.jpg.imageUrl)
        descriptionLabel.text = model.synopsis
    }
}

extension AnimeDetailViewController: ViewCodeProtocol {
    func buildViewHierarchy() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(posterImageView)
        contentView.addSubview(descriptionLabel)
    }
    
    func setupContraints() {
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        contentView.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(scrollView)
            make.left.right.equalTo(view) // => IMPORTANT: this makes the width of the contentview static (= size of the screen), while the contentview will stretch vertically
        }
        
        posterImageView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top).offset(24)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().inset(24)
            make.height.equalTo(contentView.snp.height).multipliedBy(0.3)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(posterImageView.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().inset(24)
            make.bottom.equalToSuperview().inset(24)
        }
    }
    
    func setupAccessibility() {}
}
