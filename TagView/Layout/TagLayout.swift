//
//  TagLayout.swift
//  TagView
//
//  Created by windowcow on 4/8/24.
//

import Foundation
import SwiftUI

// when TagLayoutMode.oneLine, it is expected to be located inside Scrollview
// thus it is expected to ProposedViewSize is expected as (nil x nil)
// when TagLayoutMode.presentAll, the ProposedViewSize.width is expected to be not nil.
// the size only cares about it.
struct TagLayout<T: Taggable>: Layout {
    var verticalSpacing: CGFloat = 10
    var horizontalSpacing: CGFloat = 10
    var taggableDataType: T.Type
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        switch proposal.width {
        case .none:
            calculateContainerSizeForNilProposedWidth(subviews: subviews)
        default:
            calculateContainerSizeForNotNilProposedWidth(proposedViewSize: proposal, subviews: subviews)
        }
    }
    
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        guard !subviews.isEmpty else { return }
        
        switch proposal.width {
        case .none:
            placeSubviewForProposalWithNilWidth(in: bounds, subviews: subviews)
        default:
            placeSubviewForProposalWithNotNilWidth(in: bounds, proposal: proposal, subviews: subviews)
        }
    }
}

extension TagLayout {
    private func placeSubviewForProposalWithNilWidth(in bounds: CGRect, subviews: Subviews) {
        let sortedSubviews = subviews.sorted { subview1, subview2 in
            subview1[taggableDataType.layoutValueKey] < subview2[taggableDataType.layoutValueKey]
        }
        
        var nextPosition = CGPoint()
        
        for subview in sortedSubviews {
            subview.place(at: nextPosition.applying(.init(translationX: bounds.origin.x, y: bounds.origin.y)),
                          anchor: .topLeading,
                          proposal: .unspecified)
            
            nextPosition = nextPosition.applying(
                .init(
                    translationX: subview.sizeThatFits(.unspecified).width + horizontalSpacing,
                    y: 0
                )
            )
        }
    }
    
    private func placeSubviewForProposalWithNotNilWidth(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews) {
        let origin = bounds.origin
        
        let sortedSubviews = subviews.sorted { subview1, subview2 in
            subview1[taggableDataType.layoutValueKey] < subview2[taggableDataType.layoutValueKey]
        }
        
        var nextPosition = CGPoint()
        
        var isRowStarting: Bool = true
        
        var calculatedSubviewCount = 0
        
        
        while calculatedSubviewCount < sortedSubviews.count {
            let subview = sortedSubviews[calculatedSubviewCount]
            let subviewSize: CGSize = subview.sizeThatFits(.unspecified)

            if isRowStarting {
                subview.place(at: nextPosition.applying(.init(translationX: origin.x, y: origin.y)), anchor: .topLeading, proposal: .unspecified)
                nextPosition = nextPosition.applying(
                    .init(
                        translationX: subviewSize.width + horizontalSpacing,
                        y: 0
                    )
                )
                
                calculatedSubviewCount += 1
                isRowStarting = false
            } else {
                // When current subview can't be fit in bound
                // Move to the next row
                if nextPosition.x + subviewSize.width > bounds.width {
                    nextPosition.x = 0
                    nextPosition = nextPosition.applying(
                        .init(
                            translationX: 0,
                            y: subviewSize.height + verticalSpacing
                        )
                    )
                    isRowStarting = true
                    continue
                } else { // when current subview can be fit in
                    subview.place(at: nextPosition.applying(.init(translationX: origin.x, y: origin.y)), anchor: .topLeading, proposal: .unspecified)
                    nextPosition = nextPosition.applying(
                        .init(
                            translationX: subviewSize.width + horizontalSpacing,
                            y: 0
                        )
                    )
                    calculatedSubviewCount += 1
                }
            }
        }
    }
}

extension TagLayout {
    private func calculateContainerSizeForNilProposedWidth(subviews: Subviews) -> CGSize {
        guard !subviews.isEmpty else { return CGSize() }

        return CGSize(
                width: subviews.reduce(-horizontalSpacing) {
                    $0 + $1.sizeThatFits(.unspecified).width + horizontalSpacing
                },
                height: subviews.first!.sizeThatFits(.unspecified).height
            )
    }
    
    private func calculateContainerSizeForNotNilProposedWidth(proposedViewSize: ProposedViewSize, subviews: Subviews) -> CGSize {
        guard !subviews.isEmpty else { return CGSize() }

        let proposedContainerWidth = proposedViewSize.replacingUnspecifiedDimensions().width
        
        let sortedSubviews = subviews.sorted { subview1, subview2 in
            subview1[taggableDataType.layoutValueKey] < subview2[taggableDataType.layoutValueKey]
        }
        
        var calculatedSubviewCount = 0
        
        var rowCount: Int = 1
        var isRowStarting = true
        var nextX: CGFloat = 0
        
        var minWidth: CGFloat = 0.0
        
        while calculatedSubviewCount < sortedSubviews.count {
            let subview = sortedSubviews[calculatedSubviewCount]
            let subviewSize: CGSize = subview.sizeThatFits(.unspecified)
            minWidth = max(minWidth, subviewSize.width)

            if isRowStarting {
                nextX += subviewSize.width + horizontalSpacing
                isRowStarting = false
                calculatedSubviewCount += 1
            } else {
                // When current subview can't be fit in bound
                // Move to the next row
                if nextX + subviewSize.width > proposedContainerWidth {
                    nextX = 0
                    rowCount += 1
                    isRowStarting = true
                    continue
                } else { // when current subview can be fit in
                    nextX += subviewSize.width + horizontalSpacing
                    calculatedSubviewCount += 1
                }
            }
        }
        
        return CGSize(
            width: max(proposedContainerWidth, minWidth),
            height: -verticalSpacing + CGFloat(rowCount) * (subviews.first!.sizeThatFits(.unspecified).height + verticalSpacing)
        )
    }
}
