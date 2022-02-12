/// Model representing cup size.
public struct CupSize {
    public let name: String
    public var sizeMl: Int
    
    public init(
        name: String,
        sizeMl: Int
    ) {
        self.name = name
        self.sizeMl = sizeMl
    }
}
