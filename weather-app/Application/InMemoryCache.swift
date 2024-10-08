import Foundation

class InMemoryCache<T> {
    private val cache = Map<String, T>()
    fun put(key: String, value: T) {
        cache[key] = value
    }

    fun get(key: String): T? {
        return cache[key]
    }
}
